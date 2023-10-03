Rails.application.routes.draw do
  get 'sessions/new'
  root to:"crafts#look"
  resources :users do
    resources :crafts
      
  end
  resource :profile, only: %i[show edit update]
  get "/top", to:"crafts#top"
  get "/search", to:"crafts#search"
  get "/signup", to:"users#signup"
  get "/signup", to:"users#new"
  post "/signup", to:"users#create"
  get "/login", to:"sessions#login"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"
end
