class ShrineUser < ApplicationRecord
  belongs_to :shrine
  belongs_to :user
end
