Rails.application.routes.draw do
  devise_for :users, path: '',
                     path_names: { sign_in: 'login', sign_out: 'logout' },
                     controllers: { registrations: 'registrations' }
  resources :users
  resources :apartments
  resources :orders

  get 'about_us', to: 'pages#about_us', as: :about_us

  root 'apartments#index'
end
