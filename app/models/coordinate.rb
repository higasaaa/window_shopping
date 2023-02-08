class Coordinate < ApplicationRecord
  has_one_attached :image
  
  belongs_to :coordinate_tag
  has_many :favorites, dependent: :destroy
end
