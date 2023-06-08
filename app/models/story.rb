class Story < ApplicationRecord
  belongs_to :chapter
  belongs_to :user
  has_many_attached :photo

  validates :title, :body, presence: true, length: { minimum: 3 }
end
