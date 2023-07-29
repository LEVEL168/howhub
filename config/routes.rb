Rails.application.routes.draw do
    root to:"crafts#look"
    resources :crafts
    get "/top", to:"crafts#top"
    get "/search", to:"crafts#search"
    get "/signup", to:"crafts#signup"
end
