Rails.application.routes.draw do
  get 'main/index'

  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new', as: :login
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  put    '/records/:id/share', to: 'records#share'

  resources :users
  resources :messages
  resources :records

  root 'main#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
