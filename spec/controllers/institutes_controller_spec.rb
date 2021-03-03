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

    context "number of institutes exceeds the default page size" do
      let!(:institutes) { create_list(:institute, DEFAULT_PER_PAGE + 1) }

      it "returns the default page size of values at most" do
        subject
        expect(assigns(:institutes).length).to eq(DEFAULT_PER_PAGE)
      end
    end
  end

  describe 'GET #show' do
    subject { get :show, id: institute }

    it 'assigns the requests institute to @institute' do
      subject
      expect(assigns(:institute)).to eq(institute)
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('institutes/show') }
  end

  describe 'GET #edit' do
    subject { get :edit, id: institute }

    it 'assigns the requests institute to @institute' do
      subject
      expect(assigns(:institute)).to eq(institute)
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template('institutes/edit') }
  end

  describe 'PUT #update' do
    let(:institute_params) { attributes_for(:institute, name: 'Sandwich School') }
    subject { put :update, id: institute, institute: institute_params }

    it "located the requested @institute" do
      subject
      expect(assigns(:institute)).to eq(institute)
    end

    context 'valid attributes' do
      it 'changes the attributes of @institute' do
        expect { subject }.to change { institute.reload.name }.to 'Sandwich School'
      end

      it { is_expected.to redirect_to institute }
    end

    context 'invalid attributes' do
      let(:institute_params) { attributes_for(:institute, name: nil) }
      let(:name) { institute.name }

      it 'does not change the attributes of @institute' do
        expect { subject }.to_not change { institute.reload.name }.from name
      end

      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template('institutes/edit') }
    end
  end
end
