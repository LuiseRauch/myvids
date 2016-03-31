Rails.application.routes.draw do
  devise_for :users

  resources :genres, only: [:show]

  resources :movies do
    resources :favorites, only: [:create, :destroy]
  end

  get 'search' => 'movies#search'#, as: :search_movie
  # search_movie_path
  get 'new' => 'movies#new'

  resources :users, only: [:show]

  get 'welcome/index'

  root 'welcome#index'
end
