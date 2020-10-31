Rails.application.routes.draw do

  devise_for :endusers
  scope module: :enduser do
    root to: 'homes#top'
    get 'homes/about'
    resources :endusers, only: [:show, :edit, :update]
    get 'enduders/leaving'
    patch 'endusers/leaving_out'

    resources :shippings, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm'
    get 'orders/thanks'
    resources :crat_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/all_destroy'
  end
  
  devise_for :hostusers
  scope module: :hostuser do
    get 'hostuser_homes/top'
    resources :hostusers, only: [:index, :show, :edit, :update]
    resources :itmes, only: [:index, :new, :create, :edit, :update, :show]
    
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    
    resources :order_items, only: [:update]
  end
  
end
