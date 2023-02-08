class CoordinateTag < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :coordinates, dependent: :destroy
end
