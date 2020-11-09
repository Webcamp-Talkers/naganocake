Rails.application.routes.draw do

  scope module: :enduser do
    resource :endusers, only: [:show, :edit, :update]
    get 'endusers/leaving'
    patch 'endusers/leaving_out'
    get 'homes/about'
    root to: 'homes#top'
  end
  namespace :enduser do

  devise_for :endusers, :controllers => {
    :sessions => 'endusers/sessions', :registrations => 'endusers/registrations', :passwords => 'endusers/passwords'
  }

    resources :shippings, only: [:index, :create, :edit, :update, :destroy]
    resources :items, only: [:index, :show]
    get 'orders/thanks'
    resources :orders do
      collection do
        post 'confirm'
      end
    end
    # resources :crat_items, only: [:index, :create, :update, :destroy]
    resources :genres, only: [:show]
    delete 'cart_items/all_destroy'
    resources :cart_items, only: [:index, :create, :update, :destroy]

  end

  scope module: :hostuser do
    get 'hostuser_homes/top'
    resources :hostusers, only: [:index, :show, :edit, :update]
  end
  namespace :hostuser do
  devise_for :hostusers, :controllers => {
    :sessions => 'hostusers/sessions'
   }
    resources :items, only: [:index, :new, :create, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :order_items, only: [:update]
  end

end