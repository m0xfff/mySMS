class Course < ActiveRecord::Base
  attr_accessible :allocation, :description, :end_date, :name, :number_of_semesters, :start_date

  validates :name, presence: true, length: { maximum: 255 }
  validates :allocation, presence: true, numericality: true
  validates :number_of_semesters, numericality: true
  #
  # validates :start_date, presence: true
  # validates :end_date, presence: true
  # validates :ends_after_starts
  #
  # private
  #
  # def ends_after_starts
  #   end_date < start_date ? errors.add(:end_date, "must be after start date") : nil
  # end
end
