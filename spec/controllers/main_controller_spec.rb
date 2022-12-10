require 'rails_helper'
require 'spec_helper'

describe MainController do
  # Home Page
  describe 'Home Page' do
    it 'should show the home page' do
      allow(MainController).to receive(:index)
      get :index
      expect(response).to render_template('/')
    end
  end
  # Logout
  describe 'Intermediate Logout' do
    it 'should redirect to the home page' do
      allow(MainController).to receive(:intermediate_logout)
      get :intermediate_logout
      expect(session[:id]).to eq(nil)
      expect(response).to redirect_to('/')
    end
  end
  # View Profile
  describe 'View Profile Page' do
    it 'should redirect to the home page if not logged in' do
      allow(MainController).to receive(:view_profile)
      get :view_profile
      expect(response).to redirect_to('/')
    end
    # it 'should show the profile page if logged in' do
    #   allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
    #   sign_in :current_student
    #   allow(MainController).to receive(:view_profile)
    #   get :view_profile
    #   expect(response).to redirect_to('view_profile')
    # end
    # it 'should set the @current_profile variable' do
    #   allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
    #   allow(MainController).to receive(:view_profile)
    #   get :view_profile, params: { id: 1 }
    # end
  end
  # Edit Profile
  describe 'Edit Profile' do
    it 'should redirect to the home page if student not logged in' do
      allow(MainController).to receive(:edit_profile)
      get :edit_profile
      expect(response).to redirect_to('/')
    end
    # it 'should load the edit profile page' do
    #   allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
    #   allow(MainController).to receive(:edit_profile)
    #   get :edit_profile
    #   expect(response).to render_template('edit_profile')
    # end

  end
  # Add Experience
  describe 'Add Experience Page' do
    it 'should redirect to the edit profile page on post' do
      allow(MainController).to receive(:add_experience)
      post :add_experience, params: { company: "Test", title: "Test", description: "Test", from: "01-01-2000", to: "01-01-20001", 'company' => 'Test' }, session: { experience_count: 0 }
      expect(response).to redirect_to('/edit_profile')
    end
    it 'should flash an error if all fields aren\'t filled out' do
      allow(MainController).to receive(:add_experience)
      post :add_experience, session: { experience_count: 0 }, params: {company: nil}
      expect(response).to redirect_to('/edit_profile')
      expect(flash[:notice]).to eq("Please fill out all fields")
    end
    it 'should increase the experience_count variable' do
      allow(MainController).to receive(:add_experience)
      post :add_experience, params: { company: "Test", title: "Test", description: "Test", from: "01-01-2000", to: "01-01-20001", 'company' => 'Test' }, session: { experience_count: 0 }
      expect(session[:experience_count]).to eq(1)
    end
  end
  # Remove Experience
  describe 'Remove Experience' do
    it 'should redirect to the edit profile path' do
      allow(MainController).to receive(:remove_experience)
      post :remove_experience, session: { experience_count: 0}
      expect(response).to redirect_to('/edit_profile')
    end
    it 'should decrement the experience_count variable' do
      allow(MainController).to receive(:remove_experience)
      post :remove_experience, session: { experience_count: 1 }
      expect(session[:experience_count]).to eq(0)
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
  # View University
  describe 'View University' do
    it 'should redirect to the home page if student not logged in' do
      allow(MainController).to receive(:view_university)
      get :view_university
      expect(response).to redirect_to('/')
    end
  #   it 'should redirect to view_university if student logged in' do
  #     allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
  #     allow(MainController).to receive(:view_university)
  #     get :view_university, params: { name: 'University of Iowa' }
  #     expect(response).to render_template('view_university')
  #   end
  #   it 'should set the @university variable' do
  #     allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
  #     allow(MainController).to receive(:view_university)
  #     get :view_university, params: { name: 'The University of Iowa' }
  #     university = assigns(:university)
  #     expect(university).not_to eq(nil)
  #     end
  #   it 'should set the @departments variable' do
  #     allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
  #     allow(MainController).to receive(:view_university)
  #     get :view_university, params: { name: 'University of Iowa', university_id: 1, department: 1 }
  #     departments = assigns(:departments)
  #     expect(departments).not_to eq(nil)
  #   end
  end
  # Search Instructor Page
  describe 'Search Instructor' do
    it 'should redirect to the home page if student not logged in' do
      allow(MainController).to receive(:search_instructor)
      get :search_instructor
      expect(response).to redirect_to('/')
    end
    it 'should render the search_instructor page when student logged in' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:search_instructor)
      get :search_instructor
      expect(response).to render_template('search_instructor')
    end
    it 'should set the search type to location' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:intermediate_search)
      post :intermediate_search, params: { filter: "Location" }
      expect(session[:search_type]).to eq(:location)
    end
    it 'should set the search type to supported' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:intermediate_search)
      post :intermediate_search, params: { filter: "Supported" }
      expect(session[:search_type]).to eq(:supported)
    end
    # it 'should set the search type to country' do
    #   allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
    #   allow(MainController).to receive(:intermediate_search)
    #   post :intermediate_search, params: { filter: "Country" }
    #   expect(session[:search_type]).to eq(:country)
    # end
    # it 'should set the search type to name' do
    #   allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
    #   allow(MainController).to receive(:intermediate_search)
    #   post :intermediate_search, params: { filter: "university name" }
    #   expect(session[:search_type]).to eq(:name)
    # end
    # it 'should set the url when search type is country' do
    #   allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
    #   allow(MainController).to receive(:intermediate_search)
    #   post :intermediate_search, params: { filter: "Country" }
    #   expect(session[:url]).not_to eq(nil)
    # end
    # it 'should set the url when search type is name' do
    #   allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
    #   allow(MainController).to receive(:intermediate_search)
    #   post :intermediate_search, params: { filter: "university name" }
    #   expect(session[:url]).not_to eq(nil)
    # end
    it 'should flash a message if fields aren\'t filled out' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:intermediate_search)
      get :intermediate_search, params: { filter: false }
      expect(session[:searrch_type]).to eq(nil)
      expect(flash[:notice]).to eq("Please fill out all fields")
    end
  end
  # change_page action
  describe 'change_page' do
    it 'should redirect to the home page if student not logged in' do
      allow(MainController).to receive(:change_page)
      get :change_page
      expect(response).to redirect_to('/')
    end
    it 'should redirect to search_universities if logged in' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:change_page)
      get :change_page, params: { prev: 1 }, session: { page_counter: 2 }
      expect(response).to redirect_to('/search_universities')
    end
    it 'should increment the page counter' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:change_page)
      get :change_page, params: { prev: 1 }, session: { page_counter: 2 }
      expect(response).to redirect_to('/search_universities')
      expect(session[:page_counter]).to eq(1)
    end
    it 'should decrement the page counter' do
      allow_any_instance_of(Devise::Controllers::Helpers).to receive(:student_signed_in?).and_return(true)
      allow(MainController).to receive(:change_page)
      get :change_page, params: { }, session: { page_counter: 1, university_count: 20}
      expect(response).to redirect_to('/search_universities')
      expect(session[:page_counter]).to eq(2)
    end
  end
end
