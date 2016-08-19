Rails.application.routes.draw do
  root :to => "books#index"
  devise_for :users
  resources :books
  resources :categories
  resources :writers
end
