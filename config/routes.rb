Rails.application.routes.draw do
  resources :maps
  get 'maps/index'
  get 'maps/new'
  get 'maps/show'
  resources :reviews
  post 'reviews/new', to: 'reviews#create'
  # get 'reviews/index'
  # get 'reviews/new'
  # post 'reviews/new' => 'reviews/:id', to: 'reviews#show'
  # get 'reviews/:id', to: 'reviews#show'
  # get 'reviews/edit'
  # get 'reviews/update'
  # get 'reviews/destroy'
  devise_for :users
    

  root to: 'homes#index'
  get 'homes/index'
  get 'homes/about', to: 'homes#show'
  get 'users/index'
  get 'users/new'
  get 'users/:id', to: 'users#show'
  get 'users/update'
  get 'users/destroy'
  get 'users/edit'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
