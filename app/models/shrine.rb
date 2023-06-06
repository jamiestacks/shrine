class Shrine < ApplicationRecord
  has_many :shrine_users, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

end
