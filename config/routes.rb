Rails.application.routes.draw do

  devise_for :endusers
  scope module: :enduser do
    resources :endusers, only: [:show, :edit, :update]
    get 'enduders/leaving'
    patch 'endusers/leaving_out'
    get 'homes/about'
    root to: 'homes#top'
  end
<<<<<<< HEAD
  namespace :endusers do
    root to: 'homes#top'
=======
  namespace :enduser do
    devise_for :endusers
>>>>>>> origin/develop
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
  end
<<<<<<< HEAD
  namespace :hostusers do
    resources :itmes, only: [:index, :new, :create, :edit, :update, :show]
=======
  namespace :hostuser do
  devise_for :hostusers, :controllers => {
    :sessions => 'hostusers/sessions'
   }
    resources :items, only: [:index, :new, :create, :edit, :update, :show]
>>>>>>> origin/develop
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end

end
