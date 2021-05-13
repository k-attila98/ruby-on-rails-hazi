Rails.application.routes.draw do
    root "posts#index"

    get "login", to: "sessions#new"
    post "login", to: "sessions#create"

    get "users/new", to: "users#new", as: "register"
    post "users/create"

    get "users/lost_password", as: "lost_password"
    post "users/lost_password", as: "send_lost_password"

    get "users/show/:id", to: "users#show", as: "profile"
    get "users/edit/:id", to: "users#edit", as: "profile/edit"
    put "users/update/:id", to: "users#update", as: "profile/update"

    get "new_post", to: "posts#new"
    post "new_post", to: "posts#create"

    get "my_posts", to: "posts#my_posts"

    delete "logout", to: "sessions#destroy"
    
    resources :posts
    resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
