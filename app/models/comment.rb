class Comment < ApplicationRecord
  
  belongs_to :customer
  belongs_to :coordinate

  validates :content, presence: true

end
