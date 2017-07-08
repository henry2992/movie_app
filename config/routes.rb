Rails.application.routes.draw do
  
  root 'movies#index'
  resources :movies do 
  	resources :reviews, only: [:create] do 
  		post 'comment', to: 'reviews#related_comments'
  	end
  end

  post '/movies/import', to: 'movies#import', as: 'movie_import'

  devise_for :users
end
