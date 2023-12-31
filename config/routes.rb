Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  namespace :api, as: nil do
    namespace :v1, as: nil do
      get 'vehicles', to: 'vehicles#index'
      resources :drivers, only: [:index]
      resources :locations, only: [:create]
      resources :rides, only: [:create]
      resources :payments, only: [:create]
    end
  end
end