class CommentsController < ApplicationController
  before_action :authenticate_user! 

  def new
    @product = Product.find(params[:product_id])
    @comment = Comment.new
  end

  def edit
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to product_path(@product), notice: "Update successfully"
    else
      render :edit
    end
  end

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to product_path(@product), notice: "Comment is submitted"
    else
      redirect_to product_path(@product), notice: "Comment cannot be blank"
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to product_path(@product), alert: "You have deleted the comment successfully"
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :play, :price, :difficulty)
  end

end
