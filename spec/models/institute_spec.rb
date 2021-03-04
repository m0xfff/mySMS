require 'rails_helper'

RSpec.describe Institute, :type => :model do
  subject { build(:institute) }

  it { is_expected.to have_many(:courses) }
  it { is_expected.to have_many(:notes) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_length_of(:name).is_at_most(255) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
