# frozen_string_literal: true

class Public::RegistrationsController < Devise::RegistrationsController
  
  def create
    @customer = Customer.new(customer_params)
    if @cutomer.save
      redirect_to root_path
    else
      render :new
    end
    
  end
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number)
  end
  
  
end
