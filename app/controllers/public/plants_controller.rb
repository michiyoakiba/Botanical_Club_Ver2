class Public::PlantsController < ApplicationController
before_action :ensure_correct_customer, only: [:update, :destroy] 

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.customer_id = current_customer.id
    if @plant.save
       flash[:notice] = "You have created plant successfully."  
       redirect_to public_plant_path
    else
       render :new
    end  
  end
  
  def index
    @plants = Plant.order(created_at: :desc).page(params[:page])
  end

  def show
    @plant = Plant.find(params[:id])
    @plant_comment = PlantComment.new
  end
  
  def destroy
    @plant = Plant.find(params[:id])
    @plant.destroy
    flash[:notice] = "plant was successfully destroyed."
    redirect_to public_plants_path
  end
  
  private

  def plant_params
    params.require(:plant).permit(:plant_name, :image, :caption)
  end
  
  def ensure_correct_customer
    @plant = Plant.find(params[:id])
    unless @plant.customer == current_customer
      redirect_to plants_path
    end
  end
  
end