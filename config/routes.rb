# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'channels#index'
  resources :users, only: %i[new create]
  resource :user, only: %i[edit update]
  resource :session, only: %i[new create destroy]
  resources :channels, only: %i[index show new create] do
    resources :memberships, only: %i[new create destroy]
    resources :messages, only: %i[create]
  end

  namespace :admin do
    resources :users, only: %i[show]
    resources :channels, only: %i[show]
  end
end
