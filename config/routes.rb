Rails.application.routes.draw do
  devise_for :users
  resources :users, except: [:new, :create]

  resources :seasons, only: [:index, :show, :new, :edit]

  resources :series do
    resources :favorites, only: [:create, :destroy]
  end
  get 'series/search'

  resources :genres, only: [:show]

  resources :movies do
    resources :favorites, only: [:create, :destroy]
  end

  get 'search' => 'movies#search'#, as: :search_movie
  # search_movie_path
  get 'new' => 'movies#new'

  get 'welcome/index'

  root 'welcome#index'
end
