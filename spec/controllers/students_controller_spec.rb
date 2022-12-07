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

describe MainController do
  describe 'home page' do
    it 'should call the model that shows profile info' do
      allow(MainController).to receive(:view_profile)
      post :view_profile
      expect(response).to render_template('view_profile')
    end
  end
  it 'should make the profiles info available to that template' do
    fake_results = [double('Profile'), double('Profile')]
    allow(MainController).to receive(:view_profile).and_return (fake_results)
    post :view_profile
    expect(assigns(:profiles)).to eq(fake_results)
  end
  describe 'sign up page' do
    it 'should call the model that shows profiles info' do
      allow(MainController).to receive(:sign_up)
      post :sign_up
      expect(response).to render_template('sign_up')
    end
    it 'should make the profiles info available to that template' do
      fake_results = [double('Profile'), double('Profile')]
      allow(MainController).to receive(:sign_up).and_return (fake_results)
      post :sign_up
      expect(assigns(:profiles)).to eq(fake_results)
    end
  end
  describe 'edit profiles page' do
    it 'should call the model that shows profiles info' do
      allow(MainController).to receive(:edit_profile)
      post :edit_profile
      expect(response).to render_template('edit_profile')
    end
    it 'should make the profiles info available to that template' do
      fake_results = [double('Profile'), double('Profile')]
      allow(MainController).to receive(:edit_profile).and_return (fake_results)
      post :edit_profile
      expect(assigns(:profiles)).to eq(fake_results)
    end
  end
  describe 'login page' do
    it 'should call the model that shows profiles info' do
      allow(MainController).to receive(:login)
      post :login
      expect(response).to render_template('login')
    end
    it 'should make the profiles info available to that template' do
      fake_profile = double('Profile', id: 1, student_id: 1, gre: 1, toefl: 1,
                            capa: 1, interested_major: 'Computer Science and Engineering', term: '1',
                            year: '2023', college_name: 'University of Iowa')
      allow(MainController).to receive(:login).and_return(fake_profile)
      post :login
      expect(assigns(:profiles)).to eq(fake_profile)
    end
  end
  describe 'Search Universities' do
    it 'should load the search_universities page if signed in' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:search_universities)
      post :search_universities
      expect(response).to render_template('search_universities')
    end
    it 'should redirect to the home page if not signed in' do
      allow(MainController).to receive(:search_universities)
      post :search_universities
      expect(response).to redirect_to('/')
    end
  end
end
