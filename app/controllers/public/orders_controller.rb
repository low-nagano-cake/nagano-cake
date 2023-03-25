class Public::OrdersController < ApplicationController
  def new
    @neworder = Order.new
    @newaddress = Address.new
  end

  def check
    @sum = 0

    @order = current_customer.orders.new
    @cart_items = CartItem.where(customer_id:[current_customer.id])
    @order.payment_method = params[:order][:payment_method]
    @order.shipping_cost = 500
    @order.status = 0

    ## 注文詳細入力画面から受け取ったパラメーターによって変数定義
    #0 ユーザー自身の住所選択
    if params[:order][:address_option] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = "#{current_customer.last_name}#{current_customer.first_name}"

    #1 登録済み住所から選択
    elsif params[:order][:address_option] == "1"
      @address = Address.find(params[:order][:registered_address])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    #2 新規登録を選択
    elsif params[:order][:address_option] == "2"
      @order.postal_code = params[:order][:postal_code]
      @order.address = params[:order][:address]
      @order.name = params[:order][:name]

      #上記の変数を元に登録作業
      @address = current_customer.addresses.new(address_params)
      @address.postal_code= params[:order][:postal_code]
      @address.address= params[:order][:address]
      @address.name= params[:order][:name]
      @address.save!
    end
  end

  def complete
  end

  def create
      #orderテーブル
      @order = Order.new(order_params)
      @order.save

      #order_detailsテーブル
      current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.item_id = cart_item.item_id
      order_detail.order_id = @order.id
      order_detail.price = cart_item.item.price
      order_detail.amount = cart_item.amount
      order_detail.making_status = 0
      order_detail.save!
      
  end
      current_customer.cart_items.destroy_all
      redirect_to complete_orders_path
      
  end

  # 注文履歴一覧
  def index
    @customer = Customer.find(current_customer.id)
    @orders = @customer.orders
    @order_details = OrderDetail.all
    @items = Item.all
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def order_params
    params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method,  :status,)
  end

  def address_params
    params.permit(:postal_code, :address, :name)
  end

end
