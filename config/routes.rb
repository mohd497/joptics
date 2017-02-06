Rails.application.routes.draw do


  get 'checkout/new'

  devise_for :customers, :controllers => { registrations: 'registrations' }

  root 'home#index'
  resources :products, except: [:delete]
  resources :order_lines, only: [:create, :update, :destroy]
  resource :cart, only: [:show]
  resource :checkouts, only: [:new, :create]

  get 'card' => 'checkouts#credit_card_info'
  post 'process_card' => 'checkouts#process_credit_card'

end
