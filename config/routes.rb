Rails.application.routes.draw do
  resources :services
  root to: 'admin/dashboard#index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :extra_services
  resources :reservations
  resources :supply_movements
  resources :cleaning_events
  resources :appartment_qualities
  devise_for :users
  resources :profiles
  resources :supplies
  resources :janitors
  resources :appartments

  post 'authenticate', to: 'authentication#authenticate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'create_user', to: 'authentication#create_user'
  post 'get_available_apartments', to: 'appartments#get_available_apartments'
  post 'reservations_by_user/:user_id', to: 'reservations#reservations_by_user'
  post 'check_in', to: 'reservations#check_in', as: 'check_in'
  post 'check_out', to: 'reservations#check_out', as: 'check_out'
end
