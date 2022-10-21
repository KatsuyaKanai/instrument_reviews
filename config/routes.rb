Rails.application.routes.draw do
  get 'reviews/index'
  get 'reviews/new'
  get 'reviews/show'
  get 'reviews/edit'
  get 'reviews/update'
  get 'reviews/destroy'
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
