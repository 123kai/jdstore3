class Admin::CategoryController < ApplicationController
 before_action :authenticate_user!
 before_action :admin_required
 layout "admin"

 def index
   @categories = Category.all
 end

 def show
   @category = Category.find(params[:id])
 end

 def new
   @category = Category.new

 end

 def create
   @category = Category.new(category_params)

   if @category.save
     redirect_to admin_categories_path
   else
     render :new
   end
 end

 def edit
   @category = Category.find(params[:id])
 end

 def update
   @category = Category.find(params[:id])

   if @category.update(category_params)
     redirect_to admin_categories_path
   else
     render :edit
   end
 end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to admin_categories_path
  end

  def publish
    @category = Category.find(params[:id])
    @category.publish!
    redirect_to :back
  end  


  def hide
    @category = Category.find(params[:id])
    @category.hide!
    redirect_to :back
  end

 private

 def category_params
   params.require(:category).permit(:name, :is_hidden, :description)
 end


end
