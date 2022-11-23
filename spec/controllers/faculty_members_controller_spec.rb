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
      allow(Faculty).to receive(:view_my_evaluations)
      get :view_my_evaluations
      expect(response).to render_template('my_evaluations')
    end
  end
  describe 'Create new Faculty' do
    it 'should show the sign_up page on new' do
      allow(Faculty).to receive(:view_new_faculty)
      get :view_new_faculty
      expect(response).to render_template('sign_up')
    end
  end
  describe 'Faculty Profile page' do
    it 'should show the Faculty Profile page' do
      allow(Faculty).to receive(:view_faculty_profile)
      get :view_faculty_evaluations
      expect(response).to render_template('faculty_profile')
    end
    it 'should show the Faculty Edit page' do
      allow(Faculty).to receive(:view_edit_faculty_profile)
      get :view_edit_faculty_profile
      expect(response).to render_template('edit_faculty_profile')
    end
  end
  describe 'Faculty Evaluations page' do
    it 'should show the Faculty Evaluations page' do
      allow(Faculty).to receive(:view_faculty_evaluations)
      get :view_faculty_evaluations
      expect(response).to render_template('faculty_evaluations')
    end
  end

end
