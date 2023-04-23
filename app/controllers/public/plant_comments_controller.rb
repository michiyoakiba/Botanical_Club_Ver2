class Public::PlantCommentsController < ApplicationController

# コメント機能非同期通信にした箇所
  def create
    @plant = Plant.find(params[:plant_id])
    comment = current_customer.plant_comments.new(plant_comment_params)
    comment.plant_id = @plant.id
    comment.save
  end

  def destroy
    @plant = Plant.find(params[:plant_id])
    plant_comment = @plant.plant_comments.find(params[:id])
    plant_comment.destroy
  end
  
  # 非同期通信前の記述
  # def create
  #   plant = Plant.find(params[:plant_id])
  #   comment = current_user.plant_comments.new(plant_comment_params)
  #   comment.plant_id = plant.id
  #   comment.save
  #   redirect_to plant_path(plant)
  # end
  
  # def destroy
  #   @plant = Plant.find(params[:plant_id])
  #   plant_comment = @plant.plant_comments.find(params[:id])
  #   plant_comment.destroy
  #   redirect_to plant_path(params[:plant_id])
  # end
  
  private

  def plant_comment_params
    params.require(:plant_comment).permit(:comment)
  end  
    
end
