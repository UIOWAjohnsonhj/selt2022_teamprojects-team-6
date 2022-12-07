require 'spec_helper'
require 'rails_helper'

if RUBY_VERSION >= '2.6.0'
  if Rails.version < '5'
    class ActionController::TestResponse < ActionDispatch::TestResponse
      def recycle!
        # hack to avoid MonitorMixin double-initialize error:
        @mon_mutex_owner_object_id = nil
        @mon_mutex = nil
        initialize
      end
    end
  else
    puts "Monkeypatch for ActionController::TestResponse no longer needed"
  end
end

describe FacultyMembersController do
  describe 'My Evaluations page' do
    it 'should show the My Evaluations page' do
      allow(FacultyMember).to receive(:my_evaluations)
      get :my_evaluations, params: { faculty_id: faculty.id }
      expect(response).to render_template('my_evaluations')
    end
  end
  describe 'Create new FacultyMember' do
    it 'should show the sign_up page on new' do
      allow(FacultyMember).to receive(:new)
      get :new_faculty
      expect(response).to render_template('main/sign_up')
    end
  end
  describe 'FacultyMember Profile page' do
    it 'should redirect to index page if FacultyMember Profile not found' do
      allow(FacultyMember).to receive(:faculty_profile)
      get :faculty_profile
      expect(response).to redirect_to('/')
    end
    it 'should show the FacultyMember Profile page if profile is found' do
      allow(FacultyMember).to receive(:faculty_profile)
      get :faculty_profile, params: { faculty_id: 1 }
      expect(response).to render_template('faculty_profile')
    end
  end
  describe 'FacultyMember Evaluations page' do
    it 'should show the Faculty Evaluations page' do
      allow(FacultyMember).to receive(:faculty_evaluations)
      get :faculty_evaluations, faculty_id: 1, selected_student_id: 1
      expect(response).to render_template('faculty_evaluations')
    end
    it 'should set @evaluations' do
      allow(FacultyMember).to receive(:faculty_evaluations)
      get :faculty_evaluations, params: { faculty_id: 1, selected_student_id: 1 }
      expect(@evaluations).to not_eq(nil)
    end
    it 'should set @display_name' do
      allow(FacultyMember).to receive(:faculty_evaluations)
      get :faculty_evaluations, params: { faculty_id: 1, selected_student_id: 1 }

    end
    it 'should set @student_name' do
      allow(FacultyMember).to receive(:faculty_evaluations)
      get :faculty_evaluations, params: { faculty_id: 1, selected_student_id: 1 }

    end
  end
  describe 'FacultyMember '
end
