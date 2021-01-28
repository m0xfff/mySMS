class Student < ActiveRecord::Base
  attr_accessible :birth_date, :email, :first_name, :gender, :last_name, :middle_name, :title
end
