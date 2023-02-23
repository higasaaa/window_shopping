class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :live_area, presence: true


  #ゲストログイン？
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.nickname = "ゲストさん"
      customer.live_area = "東京都"
    end
  end

  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

end
