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



  get 'intermediate_sign_up', to: 'main#intermediate_sign_up', as: 'intermediate_sign_up'
  post 'main/intermediate_sign_up'


  get 'edit_profile', to: 'main#edit_profile', as: 'edit_profile'
  post 'main/edit_profile'

  get 'faculty_profile', to: 'main#faculty_profile', as: 'faculty_profile'
  post 'main/faculty_profile'

  get 'intermediate_login', to: 'main#intermediate_login', as: 'intermediate_login'
  post 'main/intermediate_login'
  get 'search_universities', to: 'main#search_universities', as: 'search_universities'
  post 'main/search_universities'
  get 'view_university', to: 'main#view_university', as: 'view_university'
  post 'main/view_university'

  get 'reset_password', to: 'main#reset_password', as: 'reset_password'
  post 'main/reset_password'

  get 'admission_decision', to: 'main#admission_decision', as: 'admission_decision'
  post 'main/admission_decision'


  get 'intermediate_logout', to: 'main#intermediate_logout', as: 'intermediate_logout'
  post 'main/intermediate_logout'
end
