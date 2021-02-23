class Course < ActiveRecord::Base
  attr_accessible :allocation, :description, :end_date, :name, :number_of_semesters, :start_date

  validates :name, presence: true, length: { maximum: 255 }
  validates :allocation, presence: true
end
