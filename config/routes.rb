Rails.application.routes.draw do
    root to:"crafts#look"
    get "/new", to:"crafts#new"
    post "/create", to:"crafts#create"
    get "/index", to:"crafts#index"
end
