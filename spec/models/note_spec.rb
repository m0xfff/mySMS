require 'rails_helper'

RSpec.describe Note, :type => :model do
  subject { build(:note, :on_student) }

  it { is_expected.to belong_to(:entity) }
end
