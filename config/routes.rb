Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "main#index"

  get 'login', to: 'main#login', as: 'login'
  post 'main/login'

  # get 'main/sign_up', to: 'main#sign_up', as: 'main/sign_up'
  # post 'sign_up'

  get 'sign_up', to: 'main#sign_up', as: 'sign_up'
  post 'main/sign_up'

  get 'index', to: 'main#index', as: 'index'
  post 'main/index'

  get 'view_profile', to: 'main#view_profile', as: 'view_profile'
  post 'main/view_profile'

  get 'intermediate_login', to: 'main#intermediate_login', as: 'intermediate_login'
  post 'main/intermediate_login'


end
