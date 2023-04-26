class Public::CustomersController < ApplicationController
  before_action :is_matching_login_customers, only: [:edit, :update, :destroy]
  
  def index
    @customer = current_customer
    @customers = Customer.all
  end
  
  def show
    @customer = Customer.find(params[:id])
    @plants = @customer.plants.order(created_at: :desc).page(params[:page])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customers_params)
    redirect_to customers_path(@customer.id)
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
  end
  
  def withdrawal
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def customers_params
    params.require(:customer).permit(:name, :profile_image, :is_deleted)
  end
  
  def is_matching_login_customer
    　customers_id = params[:id].to_i
    unless customer_id == current_customer.id
      redirect_to plants_path
    end
  end
  
end