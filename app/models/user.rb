class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
  
  def name
    "#{last_name} #{first_name}"
  end
end
