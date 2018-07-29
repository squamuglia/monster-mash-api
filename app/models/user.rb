class User < ApplicationRecord
  has_many :heads
  has_many :foots
  has_many :hands
  has_one_attached :profile_image
end
