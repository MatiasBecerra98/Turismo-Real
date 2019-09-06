Rails.application.routes.draw do
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
