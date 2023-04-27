class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customer, only: [:edit, :update, :destroy]
  
  def index
    @customer = current_customer
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    @plants = @customer.plants.order(created_at: :desc).page(params[:page]).per(3)
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customers_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to public_customer_path(@customer.id)
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end
  
  def unsubscribe
    @customer = current_customer
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def customers_params
    params.require(:customer).permit(:name, :profile_image, :is_deleted)
  end
  
  def is_matching_login_customer
    customer_id = params[:id].to_i
    unless customer_id == current_customer.id
      redirect_to public_plants_path
    end
  end
  
end