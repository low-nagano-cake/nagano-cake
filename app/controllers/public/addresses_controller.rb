class Public::AddressesController < ApplicationController
  
  def index
    @customer = Customer.find(params[:id])
    @address = Address.new
    @addresses = @address.customers
    
    
  end
  
  def edit
    
  end
  
  def create
    
  end
  
  def update
    
  end
  
  def destroy
    
  end
  
  
end
