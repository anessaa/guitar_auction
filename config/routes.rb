Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#show', page: 'welcome'

  resources :users, only: [:new, :create, :show, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy, :show]
  get '/login', to: 'sessions#new'
  resources :guitars, shallow: true do
  resources :bids, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  end
end
