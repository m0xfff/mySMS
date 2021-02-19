class Course < ActiveRecord::Base
  attr_accessible :allocation, :description, :end_date, :name, :number_of_semesters, :start_date

  DEFAULT_PER_PAGE = 20

  validates :name, presence: true, length: { maximum: 255 }
  validates :allocation, presence: true
end
