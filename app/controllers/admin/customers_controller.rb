class Admin::CustomersController < ApplicationController
before_action :authenticate_admin!

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

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    flash[:notice] = "customer was successfully destroyed."
    redirect_to admin_customers_path
  end

  private
  def customer_params
  params.require(:customer).permit(:name,:email)
  end
end
