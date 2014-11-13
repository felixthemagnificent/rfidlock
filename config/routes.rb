Rails.application.routes.draw do
  resources :readers

  resources :permissions

  resources :workers

  get 'checkin', to: 'check_ins#auth'
  resources :check_ins

  root to: 'check_ins#index'
  devise_for :users
  resources :users
end
