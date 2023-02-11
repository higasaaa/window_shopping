class Coordinate < ApplicationRecord
  has_one_attached :image
  
  belongs_to :tag
  has_many :favorites, dependent: :destroy

  def favorited_by?(customer) #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
    favorites.exists?(customer_id: customer.id)
  end
  
  def get_coordinate_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/fashion_torso_22957-300x300.jpg')
      image.attach(io:File.open(file_path),filename: 'default-image.jpg', content_type:'image/jpeg')
    end
      image.variant(resize_to_fill: [width, height]).processed
  end
end
