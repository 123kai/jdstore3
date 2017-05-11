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
  resources :orders 






  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
