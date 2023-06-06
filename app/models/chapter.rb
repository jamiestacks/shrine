class Chapter < ApplicationRecord
  belongs_to :shrine
  has_many :stories

  validates :title, :date_start, :date_end, presence: true
  validate :within_dob_dod

  def within_dob_dod
    if date_start < self.shrine.dob
      errors.add(:date_start, :before_birth, message: "Date has to be within the lifespan")
    elsif date_end > self.shrine.dod
      errors.add(:date_end, :after_death, message: "Date has to be within the lifespan")
    elsif date_start > date_end
      errors.add(:date_start, :invalid_start_date, message: "The start date cannot be before the end date")
      errors.add(:date_end, :invalid_end_date, message:  "The end date cannot be after the start date")
    end
  end
end
