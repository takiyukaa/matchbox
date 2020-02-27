Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :bookings, only: [:index]

  resources :skills, only: [:index, :new, :create, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
  end

end
