class Customer < ApplicationRecord

  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  # through上記に記述してあるbookmarkを通してcoordinateをとってくるという意味
  has_many :coordinates, through: :bookmarks


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable

  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: {minimum: 6 }, on: :create
  validates :password_confirmation, presence: true, length: {minimum: 6 }, on: :create

  validate :check_password
  validates :live_area, presence: true
  validates :sex, inclusion: { in: ["女性","男性"] }


  #ゲストログイン
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.password_confirmation = customer.password
      customer.nickname = "ゲスト"
      customer.birthdate = "1990-08-03"
      customer.sex = "女性"
      customer.live_area = "東京都"
    end
  end


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
