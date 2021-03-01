require 'rails_helper'

RSpec.describe CoursesController, :type => :controller do
  let!(:course) { create(:course, name: "Criminology", allocation: 20) }

  describe "GET #index" do
    subject { get :index }

    it "populates an array of students" do
      subject
      expect(assigns(:courses)).to eq([course])
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("courses/index") }
  end

  describe "GET #show" do
    subject { get :show, id: course }

    it "assigns the requests course to @course" do
      subject
      expect(assigns(:course)).to eq(course)
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("courses/show") }
  end

  describe "GET #edit" do
    subject { get :edit, id: course }

    it "assigns the requests course to @course" do
      subject
      expect(assigns(:course)).to eq(course)
    end

    it { is_expected.to have_http_status(:success) }
    it { is_expected.to render_template("courses/edit") }
  end

  describe "PUT #update" do
    subject{ put :update, id: course, course: course_params }

    context "valid attributes" do
      let(:course_params) { attributes_for(:course, name: "Sociology", allocation: 30) }

      it "located the requested @course" do
        subject
        expect(assigns(:course)).to eq(course)
      end

      it "changes @course's attributes" do
        expect { subject }.to change { course.reload.name }.to("Sociology")
          .and change { course.reload.allocation }.to(30)
      end

      it { is_expected.to redirect_to course }
    end

    context "invalid attributes" do
      let(:course_params) { attributes_for(:course, name: nil, allocation: nil) }

      it "located the requested @course" do
        subject
        expect(assigns(:course)).to eq(course)
      end

      it "does not change @course's attributes" do
        subject
        course.reload

        expect(course.name).to_not be_nil
        expect(course.allocation).to_not be_nil
      end

      it { is_expected.to have_http_status(:success) }
      it { is_expected.to render_template("courses/edit") }
    end
  end

  describe "DELETE #destroy" do
    subject { delete :destroy, id: course }

    it "located the requested @course" do
      subject
      expect(assigns(:course)).to eq(course)
    end

    it "deletes the course" do
      expect{ subject }.to change(Course, :count).by(-1)
    end

    it { is_expected.to redirect_to courses_url }
  end
end
