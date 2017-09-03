Rails.application.routes.draw do


  get 'review/index'

  get 'home/index'

  get 'checkout/new'

  devise_for :customers, :controllers => { registrations: 'registrations' }

  root 'home#index'
  get 'test' => 'home#test'
  resources :products, except: [:delete] do
    member do
      post 'favorites', to: 'products#add_to_favorites'
    end
    collection do
      get 'favorites'
    end
    resources :reviews, only: [:index, :create], defaults: {format: :json}
  end
  resources :order_lines, only: [:create, :update, :destroy]
  resource :checkouts, only: [:new, :create]

  get 'cart' => 'carts#show'
  get 'carts' => 'carts#index'
  get 'card' => 'checkouts#credit_card_info'
  post 'process_card' => 'checkouts#process_credit_card'

end
