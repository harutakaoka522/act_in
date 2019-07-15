class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 100 },format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  before_validation { email.downcase! }
  mount_uploader :user_image, ImageUploader
  has_many :pictures, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
