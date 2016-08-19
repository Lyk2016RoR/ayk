Rails.application.routes.draw do

  root :to => "books#index"
  devise_for :users
  resources :favorites
  devise_for :admins

  resources :books do
    resources :comments
  end
  resources :categories
  resources :writers
  resources :admin
end
