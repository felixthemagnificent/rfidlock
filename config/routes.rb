Rails.application.routes.draw do


  resources :readers do
    resources :options
  end

  resources :permissions

  resources :workers

  get 'checkin', to: 'check_ins#auth'
  resources :check_ins

  root to: 'check_ins#index'
  devise_for :users
  resources :users
end
