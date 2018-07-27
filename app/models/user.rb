class User < ApplicationRecord
  has_many :heads
  has_many :foots
  has_many :hands
end
