class Public::ItemsController < ApplicationController
before_action :authenticate_public!, except: [:index, :show]
  
  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @newitem = CartItem.new
  end
end
