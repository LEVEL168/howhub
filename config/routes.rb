Rails.application.routes.draw do
  get 'sessions/new'
    root to:"crafts#look"
    resources :crafts
    resources :users
    get "/top", to:"crafts#top"
    get "/search", to:"crafts#search"
    get "/signup", to:"users#signup"
    get "/signup", to:"users#new"
    post "/signup", to:"users#create"
    get "/login", to:"sessions#login"
    post "/login", to:"sessions#create"
    delete "/logout", to:"sessions#destroy"
end
