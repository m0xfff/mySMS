require 'spec_helper'

describe StudentDecorator do
  let(:title) { build(:title, name: "Mr.") }
  subject { build(:student, title: title, first_name: "John", middle_name: "Adam", last_name: "Smith", birth_date: "2000-01-01").decorate }

  it { is_expected.to have_attributes(full_name: "Mr. John Adam Smith") }
  it { is_expected.to have_attributes(born: "2000-01-01") }
end
