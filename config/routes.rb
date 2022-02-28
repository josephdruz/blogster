Rails.application.routes.draw do
  root "articles#index"

  resources :articles
  resources :users

  get 'register', to: 'users#new'
end
