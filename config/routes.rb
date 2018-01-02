Rails.application.routes.draw do
  get 'comments/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'

  root 'users#index'


  resources :users, :posts, :categories
  resources :comments, only: [:new, :create]
  resources :likes, only: [:new, :create]
end
