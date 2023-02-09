class Tag < ApplicationRecord
  has_many :coordinates, dependent: :destroy
end
