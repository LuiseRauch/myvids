Rails.application.routes.draw do

  resources :genres, only: [:show]

  resources :movies

  get 'search' => 'movies#search'

  devise_for :users
  resources :users, only: [:show]

  get 'welcome/index'

  root 'welcome#index'
end
