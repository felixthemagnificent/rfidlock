Rails.application.routes.draw do


  resources :readers do
    resources :options
  end

  get 'startpage', to: 'startpage#index'

  resources :permissions

  resources :workers

  get 'checkin', to: 'check_ins#auth'
  resources :check_ins

  root to: 'startpage#index'
  devise_for :users
  resources :users
end
