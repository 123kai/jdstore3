class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:join, :quit]
  before_action :validate_search_key, only: [:search]

  def index
    @products = Product.all
    if params[:category].blank?
      @products = Product.all.recent
    else
      @category_id = Category.find_by(name: params[:category]).id
      @products = Product.where(category_id: @category_id).recent
    end
  end

  def show
    @product = Product.find(params[:id])
    @comments = @product.comments 
  end

  def add_to_cart
    @product = Product.find(params[:id])
    if !current_cart.products.include?(@product)
      current_cart.add_product_to_cart(@product)
      flash[:notice] = "Successfully add #{ @product.title } to cart!"
    else
      flash[:warning] = "Your cart already has this product!"
    end

    redirect_to :back
  end

  #------- add to and remove from collection
  def join
    @product = Product.find(params[:id])

    if !current_user.is_member_of?(@product)
      current_user.join_collection!(@product)
      flash[:notice] = "You have already added this product to Wishlist"
    end

    redirect_to product_path(@product)
  end

  def quit
    @product = Product.find(params[:id])

    if current_user.is_member_of?(@product)
      current_user.quit_collection!(@product)
      flash[:notice] = "This product has already been removed from your Wishlist"
    end

    redirect_to product_path(@product)
  end

  #------- search -------
  def search
    if @query_string.present?
      @products = search_params
    end
  end

  protected

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  end

  private

  def search_params
    Product.ransack({:title_or_description_or_particulars_cont => @query_string}).result(distinct: true)
  end


end
