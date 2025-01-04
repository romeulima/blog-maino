require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "posts#index"

  resources :posts do
    resources :comments, only: %i[ create ]
  end

  post "posts/upload", to: "posts#upload"

  resources :users, only: %i[ show ] do
    get "posts", to: "posts#user_posts"
  end

  resources :tags, only: %i[ show ] do
    get "search", on: :collection
  end

  mount Sidekiq::Web => "/sidekiq"
end
