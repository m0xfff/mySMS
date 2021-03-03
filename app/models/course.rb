class Course < ActiveRecord::Base
  attr_accessible :allocation, :description, :end_date, :name, :number_of_semesters, :start_date, :institute_id

  belongs_to :institute

  validates :name, presence: true, length: { maximum: 255 }
  validates :allocation, presence: true, numericality: { greater_than: 0 }
  validates :number_of_semesters, numericality: { greater_than: 0 }

  validates :start_date, presence: true
  validates :end_date, presence: true

  validate :ends_after_starts

  private

  def ends_after_starts
    return if end_date.blank? or start_date.blank?

    errors.add(:end_date, "must be after start date") if end_date < start_date
  end
end
