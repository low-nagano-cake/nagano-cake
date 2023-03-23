class Public::AddressesController < ApplicationController
  
  def index
    @customer = Customer.find(current_customer.id)
    @address = Address.new
    @addresses = @customer.addresses
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path, notice: "You have created shipping-address successfully."
    else
      @customer = Customer.find(current_customer.id)
      @addresses = @customer.addresses
      render :index
    end
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path(current_customer.id), notice: "You have updated shipping-address successfully."
    else
      render :edit
    end
  end
  
  def destroy
    
  end
  
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
  
end
