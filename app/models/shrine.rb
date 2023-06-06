class Shrine < ApplicationRecord
  has_many :shrine_users
  has_many :chapters
  has_many :messages

  validates :name, presence: true, length: { minimum: 3 }
  validates :dob, presence: true
  validate :birth_cannot_be_in_the_future

  def birth_cannot_be_in_the_future
    if dob.present? && dob > Date.today
      errors.add(:dod, "Can't be in the past")
    end
  end
end
