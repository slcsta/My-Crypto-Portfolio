Rails.application.routes.draw do
  get '/auth/google_oauth2/callback'
  
  get "/", to: "welcome#index"

  get "/login", to: "sessions#new"
  
  post "/login", to: "sessions#create"

  get "/signup", to: "users#new"

  delete "/logout", to: "sessions#destroy"

  
  resources :markets
  resources :trades
  resources :cryptos
  resources :users


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
