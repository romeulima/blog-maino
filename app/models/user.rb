class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, :username, :email, presence: true
  validates :username, :email, uniqueness: true

  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup

    login = conditions[:user]&.delete(:login) || conditions.delete(:login)

    return nil unless login

    where(conditions).where([ "username = :value OR email = :value", { value: login } ]).first
  end
end
