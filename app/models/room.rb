class Room < ApplicationRecord
  has_many :room_uers, dependent: :destroy
  has_many :messages, dependent: :destroy
end
