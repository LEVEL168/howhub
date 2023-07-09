Rails.application.routes.draw do
    root to:"crafts#look"
    resources :crafts
    get "/new", to:"crafts#new"
    post "/create", to:"crafts#create"
    get "/top", to:"crafts#top"
    # delete "/crafts/:id", to:"crafts#destroy"
    # # get "/crafts/:id/edit", to:"crafts#edit"
    # patch "/crafts/:id", to:"crafts#update"
    get "/search", to:"crafts#search"
end
