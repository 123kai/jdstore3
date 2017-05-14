class OrderMailer < ApplicationMailer

  def notify_order_placed(order)
    @order = order
    @user  = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] Thanks to your order and the following is your order information #{order.token}")
  end

  def apply_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: "admin@test.com", subject: "[JDstore] user#{order.user.email} apply to cancel order #{order.token}")
  end

  def notify_ship(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists

    mail(to: @user.email, subject: "[JDstore] your order #{order.token} has shipped")
  end

  def notify_cancel(order)
    @order = order
    @user = order.user
    @product_lists = @order.product_lists 

    mail(to: @user.email, subject: "[JDStore] your order #{order.token} has beed cancelled")
  end

end
