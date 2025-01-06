require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

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
