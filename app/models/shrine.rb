class Shrine < ApplicationRecord
  has_many :shrine_users, dependent: :destroy
  has_many :chapters, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  belongs_to :user

  validates :first_name, presence: true
  validates :family_name, presence: true
  validates :dob, presence: true
  validates :biography, presence: true, length: { minimum: 50, maximum: 400 }
  validate :birth_cannot_be_in_the_future

  def birth_cannot_be_in_the_future
    if dob.present? && dob > Date.today
      errors.add(:dod, "Can't be in the past")
    end
  end
end
