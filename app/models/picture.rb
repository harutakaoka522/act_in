class Picture < ApplicationRecord
    belongs_to :user
    has_many :favorites, dependent: :destroy
    has_many :favorite_users, through: :favorites, source: :user
    has_many :comments, dependent: :destroy
    has_many :picture_labels, dependent: :destroy
    has_many :labels, through: :picture_labels, source: :label
    mount_uploader :image, ImageUploader
    validates :image_title, presence: true, length: { maximum: 30 }
    validates :image, presence: true
    validates :image_content, presence: true, length: { maximum: 255 }
end
