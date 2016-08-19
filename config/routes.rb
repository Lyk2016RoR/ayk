Rails.application.routes.draw do

  root :to => "books#index"
  devise_for :users

  devise_for :admins

  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories , :comments
  resources :writers

end
