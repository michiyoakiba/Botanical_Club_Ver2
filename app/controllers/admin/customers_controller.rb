class Admin::CustomersController < ApplicationController
 # before_action :authenticate_admin!
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def create
  end

  def edit
     @customer = Customer.find(params[:id])
  end

  def update
     @customers = Customer.find(params[:id])
    if@customers.update(customer_params)
      redirect_to admin_customer_path(@customers.id)
    else
      redirect_to admin_genres_path
    end
  end

  private
  def customer_params
  params.require(:customer).permit(:id,:name,:email,:encrypted_password,:is_deleted)
  end
end
