require 'rails_helper'

RSpec.describe Student, :type => :model do
  subject { create(:student, title: "Mr.", first_name: "John", middle_name: "Adam", last_name: "Smith", email: "tester@example.com", gender: "Male", birth_date: "2000-01-01") }

  it { is_expected.to be_valid }
  it { is_expected.to have_attributes(title: "Mr.") }
  it { is_expected.to have_attributes(first_name: "John") }
  it { is_expected.to have_attributes(middle_name: "Adam") }
  it { is_expected.to have_attributes(last_name: "Smith") }
  it { is_expected.to have_attributes(email: "tester@example.com") }
  it { is_expected.to have_attributes(gender: "Male") }
  it { is_expected.to have_attributes(birth_date: Date.new(2000, 1, 1))}

  it "is invalid with a duplicate email address" do
    duplicate_student = subject.dup
    duplicate_student.valid?
    expect(duplicate_student.errors[:email]).to include("has already been taken")
  end

  it "is invalid without an email address" do
    subject.email = nil
    subject.valid?
    expect(subject.errors[:email]).to include("can't be blank")
  end

  it "is invalid if email.length is > 255" do
    subject.email = "a" * 244 + "@example.com"
    subject.valid?
    expect(subject.errors[:email]).to include("is too long (maximum is 255 characters)")
  end

  it "is valid if email is a valid email address" do
    valid_addrs = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addrs.each do |valid_addr|
      subject.email = valid_addr
      expect(subject).to be_valid
    end
  end

  it "is invalid if email isn't a valid email address" do
    invalid_addrs = %w[user@example,com user_at_foo.org user@example. user@foo_baz.com user@foo+baz.com]
    invalid_addrs.each do |invalid_addr|
      subject.email = invalid_addr
      subject.valid?
      expect(subject.errors[:email]).to include("is invalid")
    end
  end

  it "is invalid without a first_name" do
    subject.first_name = nil
    subject.valid?
    expect(subject.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid if first_name.length > 50" do
    subject.first_name = "a" * 51
    subject.valid?
    expect(subject.errors[:first_name]).to include("is too long (maximum is 50 characters)")
  end

  it "is invalid without a last_name" do
    subject.last_name = nil
    subject.valid?
    expect(subject.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid if last_name.length > 50" do
    subject.last_name = "a" * 51
    subject.valid?
    expect(subject.errors[:last_name]).to include("is too long (maximum is 50 characters)")
  end

end
