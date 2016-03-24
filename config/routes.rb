Rails.application.routes.draw do

  resources :genres, only: [:show]

  resources :movies
    resources :favorites, only: [:create, :destroy]
  get 'search' => 'movies#search'
  get 'new' => 'movies#new'

  devise_for :users
  resources :users, only: [:show]

  get 'welcome/index'

  root 'welcome#index'
end
