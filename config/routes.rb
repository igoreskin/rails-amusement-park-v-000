Rails.application.routes.draw do

  root 'welcome#home'

  resources :users
  resources :attractions

  get 'signin', to: 'sessions#new', as: 'signin'
  post 'signin', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy', as: 'logout'

  post 'riding', to: 'users#riding', as: 'riding'

end
