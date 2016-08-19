Rails.application.routes.draw do

  root :to => "books#index"
  devise_for :users

  devise_for :admins

  resources :books
  resources :categories
  resources :writers
end
