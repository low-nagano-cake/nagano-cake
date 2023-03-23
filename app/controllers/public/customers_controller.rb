class Public::CustomersController < ApplicationController
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer.id), notice: "You have updated customer successfully."
    else
      render :edit
    end
  end
  
  def exit
    @customer = Customer.find(params[:id])
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.update(is_selling: true)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end
  
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
  
  
end
