Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'events',         to: 'pages#events',    as: :events
mount StripeEvent::Engine, at: '/stripe-webhooks'

resources :products, only: [:index, :show]
resources :carts, only: [:index, :show]

resources :orders, only: [:show, :create, :index] do
  resources :payments, only: :new
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
