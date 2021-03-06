Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookings, only: [:index, :show, :update]
  
  resources :work_histories, only: [:new, :create, :edit, :update, :destroy]

  resources :users, only: [:show] do
    resources :bookings, only: [:new, :create, :show, :update]
  end

  resources :skills, only: [:index, :new, :create, :edit, :update, :destroy]
end
