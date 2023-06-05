class Message < ApplicationRecord
  belongs_to :shrine
  belongs_to :user
end
