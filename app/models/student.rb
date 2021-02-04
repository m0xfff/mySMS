class Student < ActiveRecord::Base
  attr_accessible :birth_date, :email, :first_name, :gender, :last_name, :middle_name, :title

  DEFAULT_PER_PAGE = 5

  def full_name
    [title, first_name, middle_name, last_name].select(&:present?).join(' ')
  end
end
