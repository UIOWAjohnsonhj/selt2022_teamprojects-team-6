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
  # Search Universities Page
  describe 'Search Universities' do
    it 'should load the search_universities page if signed in' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:search_universities)
      get :search_universities
      expect(response).to render_template('search_universities')
    end
    it 'should redirect to the home page if not signed in' do
      allow(MainController).to receive(:search_universities)
      get :search_universities
      expect(response).to redirect_to('/')
    end
    it 'should set @universities to nil for default' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:search_universities)
      get :search_universities
      expect(@universities).to eq(nil)
    end
    it 'should set @all_universities to nil for default' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:search_universities)
      get :search_universities
      expect(@all_universities).to eq(nil)
    end
  end
  describe 'intermediate_search' do
    it 'should redirect to the home page if student not logged in' do
      allow(MainController).to receive(:intermediate_search)
      post :intermediate_search
      expect(response).to redirect_to('/')
    end
    it 'redirect to search_universities page when signed in' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:intermediate_search)
      post :intermediate_search
      expect(response).to redirect_to('/search_universities')
    end
    it 'should flash a message if the filter isn\'t filled out' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:intermediate_search)
      post :intermediate_search
      expect(flash[:notice]).to eq('Please fill out all fields')
    end
  end
  # view_university
  describe 'View University' do
    it 'should redirect to the home page if student not logged in' do
      allow(MainController).to receive(:view_university)
      get :view_university
      expect(response).to redirect_to('/')
    end
    it 'should redirect to view_university if student logged in' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:view_university)
      get :view_university, params: { name: 'University of Iowa' }
      expect(response).to render_template('view_university')
    end
    it 'should set the @university variable' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:view_university)
      get :view_university, params: { name: 'University of Iowa' }
      university = assigns(:university)
      expect(university).not_to eq(nil)
      end
    it 'should set the @departments variable' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:view_university)
      get :view_university, params: { name: 'University of Iowa' }
      departments = assigns(:departments)
      expect(departments).not_to eq(nil)
    end
  end
end
