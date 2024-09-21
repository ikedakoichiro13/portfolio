class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  has_many :favorites, dependent: :destroy
  
  GUEST_USER_EMAIL = "guest@example.com"

  def self.guest
    find_or_create_by!(email: GUEST_USER_EMAIL) do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "guest"
      user.first_name = "guest"
      user.last_name_kana = "guest"
      user.first_name_kana = "guest"
      user.postal_code = "guest"
      user.address = "guest"
      user.telephone_number = "guest"
      user.is_active = true
    end
  end
  
  def name
    "#{last_name} #{first_name}"
  end
end
