class Coordinate < ApplicationRecord
  has_one_attached :image

  belongs_to :tag
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :total_price, presence: true
  validates :coordinates_description, presence: true, length: { maximum: 70 }

  def favorited_by?(customer) #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
    favorites.exists?(customer_id: customer.id)
  end

# 検索機能 selfを使うと省略してかける
  def self.search(keyword)
    return all if keyword.blank? #return ここで（all）処理を終える
    joins(:tag).where("tags.tag_name LIKE ?", "%#{keyword}%") #joinsはモデルと結合する
  end

  def get_coordinate_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/javascript/images/fashion_torso_22957-300x300.jpg')
      image.attach(io:File.open(file_path),filename: 'default-image.jpg', content_type:'image/jpeg')
    end
    image.variant(resize_to_fill: [width, height]).processed
  end
end
