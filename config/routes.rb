Rails.application.routes.draw do
  
  root 'movies#index'
  resources :movies

  post '/movies/import', to: 'movies#import', as: 'movie_import'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
