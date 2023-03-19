class Bookmark < ApplicationRecord
  belongs_to :customer
  belongs_to :coordinate

  validates_uniqueness_of :customer_id, scope: :coordinate_id

  def bookmarked_by?(customer)
    bookmarks.where(customer_id: customer).exists?
  end
end
