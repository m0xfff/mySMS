require 'rails_helper'

RSpec.describe Title, :type => :model do
  subject { build(:title, name: "Mr.") }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
