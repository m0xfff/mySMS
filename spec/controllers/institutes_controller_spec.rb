require 'rails_helper'

RSpec.describe InstituteController, type: :controller do
  let!(:institute) { create(:institute) }

  describe "GET #index" do
    subject { get :index }

    it "populates an array of institutes" do
      subject
      expect(assigns(:institute)).to eq([institute])
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("courses/index") }
  end
end
