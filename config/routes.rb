Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  get 'review/index'

  get 'home/index'

  get 'checkout/new'

  devise_for :customers, :controllers => { registrations: 'registrations' }

  root 'home#index'
  get '/help-center' => 'home#helpcenter'
  get '/return-policy' => 'home#returnpolicy'


  resources :products do
    member do
      post 'favorites', to: 'products#add_to_favorites'
    end
    collection do
      get 'favorites'
    end
    resources :reviews, only: [:index, :create], defaults: {format: :json}
  end
  resources :order_lines, only: [:create, :update, :destroy]
  resource :checkouts, only: [:new, :create, :update]

  get 'prescription' => 'lens#enter_pre'
  get 'select_lens' => 'lens#select_len'
  get 'cities' => 'checkouts#cities'
  post 'prescription/create' => 'lens#create'
  patch 'prescription/update' => 'lens#update'
  patch 'prescription/update_pre' => 'lens#update_pre'
  delete 'prescription/destroy' => 'lens#destroy'


  get 'cart' => 'carts#show'
  get 'carts' => 'carts#index'

  get 'card' => 'checkouts#credit_card_info'
  post 'process_card' => 'checkouts#process_credit_card'

end
