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
  end
end

describe MainController do
  describe 'home page' do
    it 'should show the home/index page' do
      allow(MainController).to receive(:index)
      get :index
      expect(response).to render_template('/')
    end
  end
  describe 'login page' do
    it 'should show the login page' do
      allow(MainController).to receive(:login)
      get :login
      expect(response).to render_template('login')
    end
  end
  describe 'signup page' do
    it 'should show the signup page for students' do
      allow(MainController).to receive(:sign_up)
      get :sign_up
      expect(response).to render_template('sign_up')
    end
    it 'should show the signup page for faculty' do
      allow(MainController).to receive(:sign_up_faculty)
      get :sign_up_faculty
      expect(response).to render_template('sign_up_faculty')
    end
  end
end
