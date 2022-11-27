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
  # patch 'stores/:id/reviews', to: 'reviews#update'
  get 'reviews/search', to: 'reviews#search'
  post 'reviews/new', to: 'reviews#create'
  # get 'stores/review' => 'reviews#destroy'
  devise_for :users
    

  root to: 'homes#index'
  get 'homes/index'
  #post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  resources :users
  # get 'users/index'
  # get 'users/:id', to: 'users#show'
  # get 'users/update'
  # get 'users/destroy'
  # get 'users/edit'
  # get 'search', to: 'stores#search'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
