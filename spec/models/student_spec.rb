require 'rails_helper'

RSpec.describe Student, :type => :model do
  subject { build(:student, title: "Mr.", first_name: "John", middle_name: "Adam", last_name: "Smith", email: "tester@example.com", gender: "Male", birth_date: "2000-01-01") }

  it { is_expected.to have_attributes(title: "Mr.") }
  it { is_expected.to have_attributes(first_name: "John") }
  it { is_expected.to have_attributes(middle_name: "Adam") }
  it { is_expected.to have_attributes(last_name: "Smith") }
  it { is_expected.to have_attributes(email: "tester@example.com") }
  it { is_expected.to have_attributes(gender: "Male") }
  it { is_expected.to have_attributes(birth_date: Date.new(2000, 1, 1))}
end
