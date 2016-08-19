Rails.application.routes.draw do
  devise_for :admins
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories
end
