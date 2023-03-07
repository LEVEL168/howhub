Rails.application.routes.draw do
    root to:"crafts#look"
    get "/new", to:"crafts#new"
    post "/create", to:"crafts#create"
    get "/top", to:"homes#top"
end
