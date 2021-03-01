require 'rails_helper'

RSpec.describe Course, :type => :model do
  subject { build(:course) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:allocation) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:end_date) }

  it { is_expected.to validate_numericality_of(:allocation).is_greater_than(0) }
  it { is_expected.to validate_numericality_of(:number_of_semesters).is_greater_than(0) }

  it { is_expected.to validate_length_of(:name).is_at_most(255) }

  it "is invalid if end_date is before start_date" do
    course = build(:course, start_date: "2021-01-1", end_date: "2020-01-01")
    course.valid?
    expect(course.errors[:end_date]).to include("must be after start date")
  end
end
