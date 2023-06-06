class Shrine < ApplicationRecord
  has_many :shrine_users
  has_many :chapters
  has_many :messages

end
