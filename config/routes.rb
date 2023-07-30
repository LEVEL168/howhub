Rails.application.routes.draw do
    root to:"crafts#look"
    resources :crafts do
        resources :users
    end
    get "/top", to:"crafts#top"
    get "/search", to:"crafts#search"
    get "/signup", to:"users#signup"
    get "/signup", to:"users#new"
    post "/signup", to:"users#create"
end
