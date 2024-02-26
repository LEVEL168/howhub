Rails.application.routes.draw do
  get 'sessions/new'
  root to:"crafts#look"
  resources :users do
    resources :crafts do
      resource :thanks, only: [:create, :destroy]
    end
  end
  resource :profile, only: %i[new show edit update]
  resources :contacts, only: [:new, :create]
  get "/done", to: "contacts#done", as: "done"
  get "/top", to:"crafts#top"
  get "/search", to:"crafts#search"
  get "/signup", to:"users#signup"
  get "/signup", to:"users#new"
  post "/signup", to:"users#create"
  get "/login", to:"sessions#login"
  post "/login", to:"sessions#create"
  delete "/logout", to:"sessions#destroy"
  get "/delete", to:"users#delete"
  post "guest_login", to: "guest_sessions#create"
  get "/user/:id", to: "users#profile"
end
