class Admin::OrdersController < ApplicationController

 def show
   @order = Order.find(params[:id])
  @items = @order.order_details
 end

end
