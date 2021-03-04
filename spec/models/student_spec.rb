require 'rails_helper'

RSpec.describe Student, :type => :model do
  let(:title) { build(:title, name: "Mr.") }
  subject { build(:student, title: title, first_name: "John", middle_name: "Adam", last_name: "Smith", email: "tester@example.com", gender: "Male", birth_date: "2000-01-01") }

  it { is_expected.to have_many(:notes) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_length_of(:first_name).is_at_most(50) }

  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_length_of(:last_name).is_at_most(50) }

  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_length_of(:email).is_at_most(255) }
  it { is_expected.to allow_value('user@example.com', 'USER@foo.COM', 'A_US-ER@foo.bar.org', 'first.last@foo.jp', 'alice+bob@baz.cn').for(:email) }
  it { is_expected.to_not allow_value('user@example,com', 'user_at_foo.org', 'user@example.', 'user@foo_baz.com', 'user@foo+baz.com').for(:email) }
end
