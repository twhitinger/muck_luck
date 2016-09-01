Rails.application.routes.draw do
  # root to: 'pages#index'
  root to: 'users#new'

  resources :github_users, only: [:index]

  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
