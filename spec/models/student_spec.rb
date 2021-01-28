require 'rails_helper'

RSpec.describe Student, :type => :model do
  it "expects the factory to be valid" do
    expect(FactoryBot.build(:student)).to be_valid
  end
end
