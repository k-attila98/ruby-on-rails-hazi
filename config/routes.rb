Rails.application.routes.draw do
    root "posts#index"

    get "login", to: "sessions#new"
    post "login", to: "sessions#create"

    get "register", to: "registrations#new"
    post "register", to: "registrations#create"

    get "new_post", to: "posts#new"
    post "new_post", to: "posts#create"

    delete "logout", to: "sessions#destroy"

    #resources :users do
        resources :posts
    #end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
