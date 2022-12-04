Rails.application.routes.draw do
  devise_for :faculty_members
  devise_for :students, :controllers => { registrations: 'students/registrations' }
  get 'resumes/index'

  get 'resumes/new'

  get 'resumes/create'

  get 'resumes/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "main#index"
  get 'login', to: 'main#login', as: 'login'
  post 'main/login'

  get 'main/intermediate_sign_up', to: redirect('sign_up')
  # post 'sign_up'

  get 'sign_up', to: 'main#sign_up', as: 'sign_up'
  post 'main/sign_up'

  get 'general_sign_up', to: 'main#general_sign_up', as: 'general_sign_up'
  post 'main/general_sign_up'
  get 'general_login', to: 'main#general_login', as: 'general_login'
  post 'main/general_login'
  get 'sign_up_faculty', to: 'main#sign_up_faculty', as: 'sign_up_faculty'
  post 'main/sign_up_faculty'

  get 'index', to: 'main#index', as: 'index'
  post 'main/index'

  get 'view_profile', to: 'main#view_profile', as: 'view_profile'
  post 'main/view_profile'

  get 'search_instructor', to: 'main#search_instructor', as: 'search_instructor'
  post 'main/search_instructor'

  get 'profile_viewer', to: 'profiles#profile_viewer', as: 'profile_viewer'
  post 'profiles/profile_viewer'

  get 'intermediate_sign_up', to: 'main#intermediate_sign_up', as: 'intermediate_sign_up'
  post 'main/intermediate_sign_up'

  get 'edit_profile', to: 'main#edit_profile', as: 'edit_profile'
  post 'main/edit_profile'

  get 'intermediate_login', to: 'main#intermediate_login', as: 'intermediate_login'
  post 'main/intermediate_login'

  get 'search_universities', to: 'main#search_universities', as: 'search_universities'
  post 'main/search_universities'

  get 'view_university', to: 'main#view_university', as: 'view_university'
  post 'main/view_university'

  get 'reset_password', to: 'main#reset_password', as: 'reset_password'
  post 'main/reset_password'

  get 'intermediate_search', to: 'main#intermediate_search', as: 'intermediate_search'
  post 'main/intermediate_search'

  get 'intermediate_logout', to: 'main#intermediate_logout', as: 'intermediate_logout'
  post 'main/intermediate_logout'

  get 'change_page', to: 'main#change_page', as: 'change_page'
  post 'main/change_page'
  # FacultyMember Routes
  get 'admission_decision', to: 'faculty_members#admission_decision', as: 'admission_decision'
  post 'faculty_members/admission_decision'

  get 'accept_application', to: 'faculty_members#accept_application', as: 'accept_application'
  post 'facultys_member/accept_application'

  get 'reject_application', to: 'faculty_members#reject_application', as: 'reject_application'
  post 'faculty_members/reject_application'

  get 'waitlist_application', to: 'faculty_members#waitlist_application', as: 'waitlist_application'
  post 'faculty_members/waitlist_application'

  get 'faculty_profile', to: 'faculty_members#faculty_profile', as: 'faculty_profile'

  get 'new_faculty', to: 'faculty_members#new_faculty', as: 'new_faculty'

  get 'faculty_evaluations', to: 'faculty_members#faculty_evaluations', as: 'faculty_evaluations'

  get 'my_evaluations', to: 'faculty_members#my_evaluations', as: 'my_evaluations'


  # Resume Routes
  get 'resumes', to: 'resumes#resume_view', as: 'resumes'
  get 'new_resume', to: 'resumes#new', as: 'new_resume'
  post 'resumes/new'
  post 'resumes', to: 'resumes#create'
  get 'resumes/:id', to: 'resumes#show', as: 'resume'
  get 'resumes/:id/edit', to: 'resumes#edit', as: 'edit_resume'
  patch 'resumes/:id', to: 'resumes#update'
  delete 'resumes/:id', to: 'resumes#destroy'



end
