Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources created for user-profile
  # get "/users/components" => "components#show"
  resources :components, only: [:show]
  resources :users, only: [:show]
  resources :projects, except: [:destroy]
  namespace :sponsor do
    resources :contributions
  end
end
