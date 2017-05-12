Rails.application.routes.draw do
  devise_for :users
  #root "welcome#index"

  root "products#index"

  # products
  resources :products do
    member do
      post :add_to_cart
    end
  end

  # admin
  namespace :admin do
    resources :products
    resources :orders   
  end

  namespace :account do
    resources :orders
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
    end
  end







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
