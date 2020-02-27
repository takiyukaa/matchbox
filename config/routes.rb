Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookings, only: [:index]
  resources :work_histories, only: [:new, :create]
 
  resources :users, only: [:show] do
    resources :bookings, only: [:new, :create]
  end
  
  resources :skills, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end
end
