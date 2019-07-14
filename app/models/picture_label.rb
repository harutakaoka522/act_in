class PictureLabel < ApplicationRecord
  belongs_to :picture
  belongs_to :label
end
