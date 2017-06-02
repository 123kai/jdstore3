Rails.application.routes.draw do
  devise_for :users
  root "welcome#index"

  #root "products#index"

  # products
  resources :products do
    member do
      post :add_to_cart
      post :join            # add to collection
      post :quit            # remove from collection
    end

    collection do
      get :search
      get :technic
      get :marvel
    end
  end

  # admin
  namespace :admin do
    resources :categories
    resources :products
    resources :orders do
      member do
        post :cancel
        post :ship
        post :shipped
        post :returen
      end
    end



  end

  namespace :account do
    resources :orders
    resources :collections
  end

  # carts
  resources :carts do
    collection do
      delete :clean
      post   :checkout
    end
  end

  #cart_items
  resources :cart_items

  #Order
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
