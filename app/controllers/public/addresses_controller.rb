class Public::AddressesController < ApplicationController
  
  def index
    @customer = Customer.find(current_customer.id)
    @address = Address.new
    @addresses = @customer.addresses
  end
  
  def edit
    
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
  
  def update
    
  end
  
  def destroy
    
  end
  
  
  private
  
  def address_params
    params.require(:address).permit(:postal_code, :address, :name)
  end
  
  
end
