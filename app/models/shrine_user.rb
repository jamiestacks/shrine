class ShrineUser < ApplicationRecord
  belongs_to :shrine
  belongs_to :user

  validates :user, uniqueness: { scope: :shrine, message: "You have already invited this user" }
  enum :status, [ :pending, :accept, :decline ]
end
