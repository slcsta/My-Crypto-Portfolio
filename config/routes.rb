Rails.application.routes.draw do
  get "/auth/google_oauth2/callback", to: "sessions#omniauth"
  
  get "/", to: "welcome#index"

  get "/login", to: "sessions#new"
  
  post "/login", to: "sessions#create"

  get "/signup", to: "users#new"

  delete "/logout", to: "sessions#destroy"

  
  resources :markets, only: [:index]
  
  resources :trades, only: [:index]
  resources :cryptos, only: [:index, :show] do
    resources :trades, shallow: true
  end
  resources :users, only: [:create, :show, :edit]


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
