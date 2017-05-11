class WelcomeController < ApplicationController

  def index
    flash[:notice] = "BUY BUY BUY！"  
  end
end
