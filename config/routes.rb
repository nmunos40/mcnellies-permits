Rails.application.routes.draw do

  

  resources :employee_licenses

  resources :trainings

  resources :licenses

  resources :users
  resources :site_permits
  resources :site_employees
  resources :sites
  resource :sessions
  resource :password_reset

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root 'site_permits#index'
  get 'export' => 'site_permits#export'
end
