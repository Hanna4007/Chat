# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: %i[index new create]
  resource :user, only: %i[edit update]
  resource :session, only: %i[new create destroy]
  resources :channels do
    resources :memberships
    resources :messages
  end

  get 'my_channels_show/:id', to: 'channels#my_channels_show', as: 'my_channels_show'
end
