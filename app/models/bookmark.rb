class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :coordinate
  
  # バリデーション（ユーザーと記事の組み合わせは一意
  # 同じ投稿を複数回お気に入り登録させないため。
  validates_uniqueness_of :customer_id, scope: :coordinate_id
  
  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end
end
