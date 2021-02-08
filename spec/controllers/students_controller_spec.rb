require 'rails_helper'

RSpec.describe StudentsController, :type => :controller do
  let!(:student) { create(:student, first_name: "John", last_name: "Smith") }

  describe "GET #index" do
    subject { get :index }

    it "populates an array of students" do
      subject
      expect(assigns(:students)).to eq([student])
    end

    it "should be decorated" do
      subject
      expect(assigns(:students)).to be_decorated_with StudentsDecorator
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("students/index") }

    context "with render_views" do
      render_views

      it "has a Students heading" do
        expect(subject.body).to match /<h1>🎓 Students</
      end
    end
  end

  describe "GET #show" do
    subject { get :show, id: student }

    it "assigns the requests student to @student" do
      subject
      expect(assigns(:student)).to eq(student)
    end

    it "should be decorated" do
      subject
      expect(assigns(:student)).to be_decorated_with StudentDecorator
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("students/show") }
  end

  describe "GET #edit" do
    subject { get :edit, id: student }

    it "assigns the requests student to @student" do
      subject
      expect(assigns(:student)).to eq(student)
    end

    it "should be decorated" do
      subject
      expect(assigns(:student)).to be_decorated_with StudentDecorator
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("students/edit") }
  end

  describe "PUT #update" do
    subject { put :update, id: student, student: attributes_for(:student, first_name: "Mike", last_name: "Jones") }

    it "located the requested @student" do
      subject
      expect(assigns(:student)).to eq(student)
    end

    it "should be decorated" do
      subject
      expect(assigns(:student)).to be_decorated_with StudentDecorator
    end

    it "changes @student's attributes" do
      subject
      expect { student.reload }.to change { student.first_name }.to("Mike")
        .and change { student.last_name }.to("Jones")
    end

    it { is_expected.to have_http_status(:redirect) }
    it { is_expected.to redirect_to student }
  end

  describe "DELETE #destroy" do
    subject { delete :destroy, id: student }

    it "located the requested @student" do
      subject
      expect(assigns(:student)).to eq(student)
    end

    it "deletes the student" do
      expect{ delete :destroy, id: student }.to change(Student, :count).by(-1)
    end

    it { is_expected.to redirect_to students_url }
  end
end
