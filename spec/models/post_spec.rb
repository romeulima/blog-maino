require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it "should validate the presence of the title" do
      post = build(:post, title: nil)
      expect(post).to_not be_valid
      expect(post.errors[:title]).to include("não pode ficar em branco")
    end

    it "should validate the presence of the content" do
      post = build(:post, content: nil)
      expect(post).to_not be_valid
      expect(post.errors[:content]).to include("não pode ficar em branco")
    end

    it "should add tags correctly" do
      post = build(:post)
      allow(post).to receive(:add_tags)
      post.add_tags("tag1, tag2, tag3")
      expect(post).to have_received(:add_tags).with("tag1, tag2, tag3")
    end
  end

  describe '.file_valid_format?' do
    it 'should return true for valid text format' do
      file = File.open(Rails.root.join('spec/utils/posts.txt'))
      text = file.read

      expect(Post.file_valid_format?(text)).to be true
    end

    it 'should return false if text is empty' do
      text = ''

      expect(Post.file_valid_format?(text)).to be false
    end

    it 'should return false if title or content is blank' do
      file_blank_title = File.open(Rails.root.join('spec/utils/without_title.txt'))
      file_blank_content = File.open(Rails.root.join('spec/utils/without_content.txt'))
      text_blank_title = file_blank_title.read
      text_blank_content = file_blank_content.read

      expect(Post.file_valid_format?(text_blank_title)).to be false
      expect(Post.file_valid_format?(text_blank_content)).to be false
    end

    it 'should return true even if tags are missing' do
      file = File.open(Rails.root.join('spec/utils/posts_with_and_without_tags.txt'))
      text = file.read

      expect(Post.file_valid_format?(text)).to be true
    end
  end
end
