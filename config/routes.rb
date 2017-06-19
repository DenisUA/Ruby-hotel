Rails.application.routes.draw do
  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { registrations: 'registrations',
                                    omniauth_callbacks: 'callbacks' }
  resources :users
  resources :apartments
  resources :orders
  resources :homes, only: %i[index]

  root 'apartments#index'
end
