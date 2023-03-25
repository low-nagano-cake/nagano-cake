class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
   @order_details = @order.order_details
   @order_detail_total = @order
   # @order_detail_total = @order.customer.order_details.all
    # カートに入ってる商品の合計金額
    # @total = @order_detail_total.inject(0) { |sum, item| sum + item.sum_of_price }
  
  end

  def update
   @order = Order.find(params[:id])
   if @order.update(order_params)
    redirect_to admin_order_path(@order)
   else
    render "show"
   end
  end

  private

  def order_params
   params.require(:order).permit(:status)
  end

end


