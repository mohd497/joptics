Rails.application.routes.draw do


  devise_for :customers, :controllers => { registrations: 'registrations' }

  root 'home#index'
  resources :products, except: [:delete]
  resources :order_lines, only: [:create, :update, :destroy]
  resource :cart, only: [:show]
end
