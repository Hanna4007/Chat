class User < ApplicationRecord
  has_many :messages
  has_many :memberships
  has_many :channels, through: :memberships  

  has_secure_password

  validates :phone_number, presence: true, uniqueness: true, format: { with: /\A\+\d+\z/ }, length: { is: 13 }
  validates :password, confirmation: true, length: { minimum: 6, maximum: 70 }, if: :password_validation_required?
  validates :login, presence: true, length: { minimum: 2, maximum: 40 }

  private

  def password_validation_required?
    new_record? || password_digest_changed?
  end
end
