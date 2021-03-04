require 'rails_helper'

RSpec.describe Note, type: :model do
  subject { build(:student_note) }

  it { is_expected.to belong_to(:entity) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }
  it { is_expected.to validate_presence_of(:entity) }

  it { is_expected.to allow_value('Student', 'Course', 'Institute').for(:entity_type) }
  it { is_expected.to_not allow_value('Title').for(:entity_type) }
end
