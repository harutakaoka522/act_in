class Label < ApplicationRecord
  validates :label_title, presence: true
  has_many :picture_labels, dependent: :destroy
  has_many :pictures, through: :picture_labels, source: :picture
end
