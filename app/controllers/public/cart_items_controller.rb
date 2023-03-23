class Public::CartItemsController < ApplicationController

  def index

  end

  def update

  end

  def destroy

  end

  def destroy_all

  end


  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to cart_path
  end

private

  def item_params
   params.permit(:amount)
  end

end
