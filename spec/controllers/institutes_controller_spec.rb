require 'rails_helper'

RSpec.describe InstitutesController, type: :controller do
  let!(:institute) { create(:institute) }

  describe "GET #index" do
    subject { get :index }

    it "populates an array of institutes" do
      subject
      expect(assigns(:institutes)).to eq([institute])
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("institutes/index") }
  end
end
