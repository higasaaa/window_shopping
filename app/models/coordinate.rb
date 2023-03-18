class Coordinate < ApplicationRecord
  has_one_attached :image

  attr_accessor :rank

  belongs_to :tag
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks,
  dependent: :destroy

  validates :total_price, presence: true
  validates :coordinates_description, presence: true

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

# 検索機能
  def self.search(keyword)
    return all if keyword.blank?
    joins(:tag).where("tags.tag_name LIKE ?", "%#{keyword}%")
  end

  def get_coordinate_image
    unless image.attached?
      file_path = Rails.root.join('app/javascript/images/fashion_torso_22957-300x300.jpg')
      image.attach(io:File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end

end
