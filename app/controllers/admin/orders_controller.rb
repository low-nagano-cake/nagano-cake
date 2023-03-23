class Admin::OrdersController < ApplicationController

 def show
   @order = Order.find([:id])
   @orders = @order.customer.items.all
 end

end
