require 'rails_helper'

RSpec.describe Student, :type => :model do

  let(:student) { build(:student, title: "Mr", first_name: "John", middle_name: "Adam", last_name: "Smith") }

  it "returns a student's full name" do
    expect(student.full_name).to eq("Mr John Adam Smith")
  end

  it "returns a student's full name even if no middle name is supplied" do
    student.middle_name = nil
    expect(student.full_name).to eq("Mr John Smith")
  end

  context "with the title 'Miss'" do
    subject { build(:student, title: "Miss")}
    it { is_expected.to have_attributes(title: "Miss") }
  end

  context "with the first_name 'Alice'" do
    subject { build(:student, first_name: "Alice")}
    it { is_expected.to have_attributes(first_name: "Alice") }
  end

  context "with the middle_name 'Jane'" do
    subject { build(:student, middle_name: "Jane")}
    it { is_expected.to have_attributes(middle_name: "Jane") }
  end

  context "with the last_name 'Smith'" do
    subject { build(:student, last_name: "Smith")}
    it { is_expected.to have_attributes(last_name: "Smith") }
  end

  context "with the email 'tester@example.com'" do
    subject { build(:student, email: "tester@example.com")}
    it { is_expected.to have_attributes(email: "tester@example.com") }
  end

  context "with the birth_date '2000-6-6'" do
    subject { build(:student, birth_date: "2000-6-6")}
    it { is_expected.to have_attributes(birth_date: Date.new(2000, 6, 6)) }
  end

  context "with the gender 'female'" do
    subject { build(:student, gender: "female")}
    it { is_expected.to have_attributes(gender: "female") }
  end
end
