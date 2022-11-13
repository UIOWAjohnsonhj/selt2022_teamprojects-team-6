require 'spec_helper'
require 'rails_helper'
#test
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

describe MainController do
  describe 'home page' do
    #------ going to move to Faculty controller spec
    it 'should call the model that shows profile info' do
      allow(Profile).to receive(:view_profile)
      post :view_profile
      expect(response).to render_template('view_profile')
    end
  end
  describe 'My Evaluations page' do
    it 'should show the my Evaluations page' do
      allow(Faculty).to receive(:view_my_evaluations)
      get :view_my_evaluations
      expect(response).to render_template('my_evaluations')
    end
    it 'should show the Faculty Evaluations page' do
      allow(Faculty).to receive(:view_faculty_evaluations)
      get :view_faculty_evaluations
      expect(response).to render_template('faculty_evaluations')
    end
    #----------
  end
  it 'should call the model that shows profile info' do
    allow(Profile).to receive(:view_profile)
    post :view_profile
    expect(response).to render_template('view_profile')
  end
  it 'should make the profile info available to that template' do
    fake_results = [double('Profile'), double('Profile')]
    allow(Profile).to receive(:view_profile).and_return (fake_results)
    post :view_profile
    expect(assigns(:profiles)).to eq(fake_results)
  end
  describe 'sign up page' do
    it 'should call the model that shows profile info' do
      allow(Profile).to receive(:sign_up)
      post :sign_up
      expect(response).to render_template('sign_up')
    end
    it 'should make the profile info available to that template' do
      fake_results = [double('Profile'), double('Profile')]
      allow(Profile).to receive(:sign_up).and_return (fake_results)
      post :sign_up
      expect(assigns(:profiles)).to eq(fake_results)
    end
    describe 'edit profile page' do
      it 'should call the model that shows profile info' do
        allow(Profile).to receive(:edit_profile)
        post :edit_profile
        expect(response).to render_template('edit_profile')
      end
      it 'should make the profile info available to that template' do
        fake_results = [double('Profile'), double('Profile')]
        allow(Profile).to receive(:edit_profile).and_return (fake_results)
        post :edit_profile
        expect(assigns(:profiles)).to eq(fake_results)
      end
      describe 'login page' do
        it 'should call the model that shows profiles info' do
          allow(Profile).to receive(:login)
          post :login
          expect(response).to render_template('login')
        end
        it 'should make the profile info available to that template' do
          fake_results = [double('Profile'), double('Profile')]
          allow(Profile).to receive(:login).and_return (fake_results)
          post :login
          expect(assigns(:profiles)).to eq(fake_results)
        end
      end
    end
  end
end
