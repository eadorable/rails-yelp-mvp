Rails.application.routes.draw do
  resources :reviews, only: [:destroy] # does not need to be nested
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end
end
