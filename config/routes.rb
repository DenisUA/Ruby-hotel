Rails.application.routes.draw do
  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { registrations: 'registrations' }
  resources :users
  resources :apartments
  resources :orders
  resources :contacts

  namespace :admin do
    resources :contacts
  end

  root 'apartments#index'
end
