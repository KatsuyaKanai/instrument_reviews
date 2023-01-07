Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
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
  post 'reviews/new', to: 'reviews#create'
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'homes#index'
  get 'homes/index'
  resources :users
  get 'message', to: 'messages#index', as: 'message'
  post 'done' => 'messages#done'
end
