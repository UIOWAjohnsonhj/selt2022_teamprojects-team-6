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
  # Home Page
  describe 'Home Page' do

  end
  # Sign Up Page
  describe 'Sign Up Page' do

  end
  # Edit Profiles Page
  describe 'Edit Profiles Page' do

  end
  # Login Page
  describe 'Login Page' do

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
  # View University
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
