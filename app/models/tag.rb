class Tag < ApplicationRecord
  has_many :coordinates, dependent: :destroy

  validates :tag_name, presence: true
end
