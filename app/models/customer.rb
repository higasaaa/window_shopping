class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname, presence: true
  validates :email, presence: true
  validates :password, presence: true, length: {minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, length: {minimum: 6 }, on: :create
  # 上記の２つのパスワードが一致していなかったらプライベート下の処理を実行する
  validate :check_password
  validates :live_area, presence: true
  validates :sex, inclusion: { in: ["女性","男性"] }


  #ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.nickname = "ゲストさん"
      customer.live_area = "東京都"
      customer.sex = ["女性"]
    end
  end

  # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  private
  def check_password
    if password != password_confirmation
      errors.add(:password_confirmation, "パスワードが一致しません")
    end
  end

end
