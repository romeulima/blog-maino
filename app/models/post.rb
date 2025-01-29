class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  validates :title, :content, presence: true

  enum :status, { active: 0, deleted: 10 }

  def add_tags(tags)
    return if tags.blank?

    tags.split(",").each do |tag|
      tag = I18n.transliterate(tag.strip.downcase)
      self.tags << Tag.find_or_create_by(name: tag)
    end
  end

  def update_post_tags(tags)
    post_tags.destroy_all
    add_tags(tags)
  end

  def self.file_valid_format?(text)
    return false if text.blank?

    posts = text.split("\n\n")

    posts.each do | post |
      title, content, = post.split("\n")
      return false if title.blank? || content.blank?
    end
    true
  end
end
