class ShrineUser < ApplicationRecord
  belongs_to :shrine
  belongs_to :user

  enum :status, [ :pending, :accept, :decline ]
end
