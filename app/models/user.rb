class User < ApplicationRecord
  has_many :messages
  has_many :memberships
  has_many :channels, through: :memberships  

  has_secure_password
end
