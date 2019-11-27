Rails.application.routes.draw do

  devise_for :users

  root 'tops#index'
  get 'home/about' => "tops#about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :index]
  resources :books
end
