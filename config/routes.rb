Rails.application.routes.draw do
    root to:"crafts#look"
    resources :crafts
    # get "posts/:id", to:"posts#show"
    get "/top", to:"crafts#top"
    get "/search", to:"crafts#search"
end
