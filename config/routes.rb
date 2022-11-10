Rails.application.routes.draw do
  
  
  resources :stores do
    resources :reviews
  end
  post 'stores/new', to: 'stores#create'
  resources :stores do
    collection do
      get 'search'
    end
  end
  get 'reviews/search', to: 'reviews#search'
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
  # get 'search', to: 'stores#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
