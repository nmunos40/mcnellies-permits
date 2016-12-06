Rails.application.routes.draw do

  

  resources :issues

  resources :employee_trainings

  get "about", to: 'info#about'

  resources :employee_licenses

  resources :trainings

  resources :licenses

  resources :users
  resources :site_permits
  resources :site_employees do 
    collection {post :import}
  end
  resources :sites
  resource :sessions
  resource :password_reset

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'home', to: 'sites#index'

  root 'sessions#new'
  get 'export' => 'site_permits#export'
end
