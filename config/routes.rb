Rails.application.routes.draw do
    root to:"crafts#look"
    get "/new", to:"crafts#new"
    post "/create", to:"crafts#create"
    get "/top", to:"homes#top"
    delete "/crafts/:id", to:"crafts#destroy"
    get "/crafts/:id/edit", to:"crafts#edit"
    patch "/crafts/:id", to:"crafts#update"
end
