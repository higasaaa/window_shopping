class Tag < ApplicationRecord
  has_many :coordinates, dependent: :destroy

  # バリデーション
  validates :tag_name, presence: true
end
