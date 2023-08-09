Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  resources :companies
  resources :tweets, only: [:index]

  namespace :api do
    resources :users
    resources :tweets
  end
end
