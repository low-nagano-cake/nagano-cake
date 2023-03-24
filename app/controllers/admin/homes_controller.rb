class Admin::HomesController < ApplicationController
  
  @orders = Order.all
  
end
