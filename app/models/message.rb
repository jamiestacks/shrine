class Message < ApplicationRecord
  belongs_to :shrine
  belongs_to :user

  validates :content, presence: true
end
