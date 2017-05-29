Rails.application.routes.draw do
  get 'home/index'

  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { registrations: 'registrations' }
  resources :users
  resources :apartments
  resources :orders
  resources :home, only: :index

  root 'apartments#index'
end
