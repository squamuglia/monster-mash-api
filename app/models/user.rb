class User < ApplicationRecord
  has_many :heads
  has_many :foots
  has_many :hands

  # SHA-256(salt => very random string + password) => password digest
  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
end
