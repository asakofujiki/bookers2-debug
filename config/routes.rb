Rails.application.routes.draw do
  root 'home#top'
  devise_for :users
  resources :users, only: [:show,:index,:edit,:update]
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  get 'home/about' => 'home#about'
end