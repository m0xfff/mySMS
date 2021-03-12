require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { build(:student_note) }

  it { is_expected.to belong_to(:noteable) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:noteable) }

  it { is_expected.to allow_value('Student', 'Course', 'Institute').for(:noteable_type) }
  it { is_expected.to_not allow_value('Title').for(:noteable_type) }
end
