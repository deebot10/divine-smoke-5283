class PlantsController < ApplicationController
  def destroy
    Plant.destroy(params[:id])
    redirect_to '/plots'    
  end    
end