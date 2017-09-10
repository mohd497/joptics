Rails.application.routes.draw do


  get 'home/index'

  get 'checkout/new'

  devise_for :customers, :controllers => { registrations: 'registrations' }

  root 'home#index'
  get 'test' => 'home#test'
  resources :products, except: [:delete]
  resources :order_lines, only: [:create, :update, :destroy]
  resource :checkouts, only: [:new, :create]

  get 'prescription' => 'lens#enter_pre'
  get 'select_lens' => 'lens#select_len'
  post 'prescription/create' => 'lens#create'
  patch 'prescription/update' => 'lens#update'
  patch 'prescription/update_pre' => 'lens#update_pre'
  delete 'prescription/destroy' => 'lens#destroy'


  get 'cart' => 'carts#show'
  get 'carts' => 'carts#index'

  get 'card' => 'checkouts#credit_card_info'
  post 'process_card' => 'checkouts#process_credit_card'

end
