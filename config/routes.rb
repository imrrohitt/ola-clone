Rails.application.routes.draw do
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
      resources :locations, only: [:create]
    end
  end
end