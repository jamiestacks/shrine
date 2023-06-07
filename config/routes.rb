Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :shrines do
    resources :chapters, only: [:index, :new, :create]
    resources :messages, only: [:index, :create]
    resources :shrine_users, only: [:new, :create]
  end

  resources :chapters, only: [:show, :edit, :update, :destroy] do
    resources :stories, only: [:new, :create]
  end

  resources :stories, only: [:edit, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
