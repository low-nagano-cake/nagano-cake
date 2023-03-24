class Public::CartItemsController < ApplicationController

  def index
   @cart_items = current_customer.cart_items.all
   @sum = 0
  end

  def update
    cart_item=CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item=CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end


  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all

    #カートに同じ商品が入っているか判定。入っている場合は合計して表示。
    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
      new_amount = cart_item.amount + @cart_item.amount
      cart_item.update_attribute(:amount, new_amount)
      @cart_item.delete
     end
   end
    @cart_item.save
    redirect_to cart_items_path
  end

private

  def cart_item_params
   params.require(:cart_item).permit(:amount, :item_id, :customer_id)
  end

end