class Chapter < ApplicationRecord
  belongs_to :shrine
  has_many :stories

end
