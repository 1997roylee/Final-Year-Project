# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :auth, only: [] do
    collection do
      post 'create', to: 'auth#create'
      post :login
    end
  end

  namespace :api do
    namespace :v1 do
      resources :recommend, only: %i[index]
      resources :teachers, only: %i[index]
      resources :notifications, only: %i[index create]

      resources :courses, only: %i[create show update] do
        resources :enrols, only: %i[create update], module: :courses
        resources :comments, only: %i[create destroy], module: :courses
        resources :ratings, only: %i[create], module: :courses
        resources :lectures, only: %i[create update destroy], module: :courses do
          resources :assignments, only: %i[create update destroy], module: :lectures
        end
      end

      resources :enrols, only: %i[index], module: :courses

      resources :users, only: %i[index show] do
        collection do
          get 'me', to: 'users#me'
          patch 'me', to: 'users#update'
          # post :login
        end
      end
    end
  end
end
