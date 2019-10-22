Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
mount StripeEvent::Engine, at: '/stripe-webhooks'

resources :products, only: [:index, :show]
#resources :orders, only: [:show, :create]

resources :orders, only: [:show, :create] do
  resources :payments, only: :new
end

  # get '/pages/products', to: 'pages#products', as: 'products'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
