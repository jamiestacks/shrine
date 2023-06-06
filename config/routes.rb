Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :shrines do
    resources :chapters, only: [:new, :create]
    resources :messages, only: [:index, :new, :create]
    resources :shrine_users, only: [:new, :create]
  end

  resources :chapters, only: [:index, :show, :edit, :update] do
    resources :stories, only: [:new, :create]
  end

  resources :stories, only: [:edit, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
