Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "main#index"
  get 'login', to: 'main#login', as: 'login'
  post 'main/login'

  get 'main/intermediate_sign_up', to: redirect('sign_up')
  # post 'sign_up'

  get 'sign_up', to: 'main#sign_up', as: 'sign_up'
  post 'main/sign_up'

  get 'index', to: 'main#index', as: 'index'
  post 'main/index'

  get 'view_profile', to: 'main#view_profile', as: 'view_profile'
  post 'main/view_profile'

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

  get 'reset_password_one', to: 'main#reset_password_one', as: 'reset_password_one'
  post 'main/reset_password_one'

  get 'reset_password_two', to: 'main#reset_password_two', as: 'reset_password_two'
  post 'main/reset_password_two'


  get 'admission_decision', to: 'main#admission_decision', as: 'admission_decision'
  post 'main/admission_decision'

  get 'intermediate_search', to: 'main#intermediate_search', as: 'intermediate_search'
  post 'main/intermediate_search'

  get 'intermediate_logout', to: 'main#intermediate_logout', as: 'intermediate_logout'
  post 'main/intermediate_logout'

  get 'change_page', to: 'main#change_page', as: 'change_page'
  post 'main/change_page'

  get 'accept_application', to: 'main#accept_application', as: 'accept_application'
  post 'main/accept_application'

  get 'reject_application', to: 'main#reject_application', as: 'reject_application'
  post 'main/reject_application'

  get 'waitlist_application', to: 'main#waitlist_application', as: 'waitlist_application'
  post 'main/waitlist_application'

  # FacultyMember Routes
  get 'faculty_profile', to: 'faculty_members#faculty_profile', as: 'faculty_profile'
  get 'new_faculty', to: 'faculty_members#new_faculty', as: 'new_faculty'
  get 'faculty_evaluations', to: 'faculty_members#faculty_evaluations', as: 'faculty_evaluations'
  get 'my_evaluations', to: 'faculty_members#my_evaluations', as: 'my_evaluations'

end
