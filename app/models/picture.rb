class Picture < ApplicationRecord
    belongs_to :user
    has_many :labels, through: :picture_labels, source: :label
    has_many :picture_labels, dependent: :destroy
    #, inverse_of: :picture
    mount_uploader :image, ImageUploader
end
