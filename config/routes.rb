Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :shrines do
    resources :chapters, only: [:new, :create]
  end

  resources :chapters, only: [:show, :edit, :update] do
    
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
