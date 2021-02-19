require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do
  let!(:course) { create(:course) }

  describe "GET #index" do
    subject { get :index }

    it "populates an array of students" do
      subject
      expect(assigns(:courses)).to eq([course])
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("courses/index") }
  end
end
