Rails.application.routes.draw do

  scope module: :enduser do
    resources :endusers, only: [:show, :edit, :update]
    get 'enduders/leaving'
    patch 'endusers/leaving_out'
    get 'homes/about'
  end
  namespace :endusers do
    devise_for :endusers
    root to: 'homes#top'
    resources :shippings, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    resources :orders, only: [:new, :create, :index, :show]
    post 'orders/confirm'
    get 'orders/thanks'
    resources :crat_items, only: [:index, :create, :update, :destroy]
    delete 'cart_items/all_destroy'
  end

  scope module: :hostuser do
    get 'hostuser_homes/top'
    resources :hostusers, only: [:index, :show, :edit, :update]
  end
  namespace :hostusers do
  devise_for :hostusers, :controllers => {
    :sessions => 'hostusers/sessions'
   }
    resources :itmes, only: [:index, :new, :create, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end

end
