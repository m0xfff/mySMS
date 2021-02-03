require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do
  describe "GET #index" do
    subject { get :index }

    it "returns http success" do
      expect(subject).to have_http_status(:success)
    end

    it "renders the index template" do
      expect(subject).to render_template("students/index")
    end

    context "with render_views" do
      render_views

      it "has a Students heading" do
        expect(subject.body).to match /<h1>Students</
      end
    end
  end
end
