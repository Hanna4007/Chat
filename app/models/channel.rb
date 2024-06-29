class Channel < ApplicationRecord
  has_many :messages
  has_many :memberships
  has_many :users, through: :memberships

  validates :name, presence: true, length: { minimum: 2, maximum: 40 }
end
