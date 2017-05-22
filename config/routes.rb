Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users
  resources :apartments

  root 'apartments#index'
end
