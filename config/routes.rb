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

  resources :favorites, only: [:index, :show, :update, :destroy]

  resources :lists, only: [:index, :new, :create, :show] do
    resources :favorites, only: [:update]
  end

  resources :lists, only: [:update]

  resources :users, only: [:show] do
    resources :follows, only: [:create, :destroy]
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'sign_in', to: "users#sign_in"
    end
  end

  "api/v1/sign_in"
end
