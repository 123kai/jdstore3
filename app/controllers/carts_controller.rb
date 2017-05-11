class CartsController < ApplicationController

  def clean
    current_cart.clean!
    flash[:warning] = "You cart is empty now"
    redirect_to carts_path    
  end
end
