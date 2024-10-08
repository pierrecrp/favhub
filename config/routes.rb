Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  resources :dashboards, only: [:index]

  resources :favorites, only: [:index, :show, :update, :destroy] do
    resources :favorite_tags, only: [:create, :destroy]
  end

  resources :lists, only: [:index, :new, :create, :show, :update] do
    resources :favorites, only: [:update]
  end

  resources :followers, only: [:create, :destroy]

  resources :tags, only: [:create]

  resources :users, only: [:show] do
    resources :follows, only: [:create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'login', to: "sessions#create"

      resources :favorites, only: [:create]
    end
  end
end
