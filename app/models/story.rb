class Story < ApplicationRecord
  belongs_to :chapter
  belongs_to :user

  validates :title, :body, presence: true, length: { minimum: 3 }

end
