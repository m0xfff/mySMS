require 'rails_helper'

RSpec.describe Course, :type => :model do
  subject { build(:course, name: "Criminology", description: "A Course", number_of_semesters: 2,
                  start_date: "2021-02-12", end_date: "2021-10-29", allocation: 30) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(255) }

  it { is_expected.to validate_presence_of(:allocation) }
end
