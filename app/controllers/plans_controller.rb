class PlansController < ApplicationController
  protect_from_forgery
  def index
    @plans = Plan.where(user_id: params[:id])
  end

  def create
    @plan = Plan.new(plan_params)
    @plan.save!
  end 

  def show
    @plans = Plan.where(user_id: params[:id])
    # @plan = Plan.find(params[:id])
  end

  def destroy
    @plan = Plan.find(params[:id])  
    @plan.destroy
    redirect_to plans_path
  end
  def edit
    @plan = Plan.find(params[:id])
    @plan.update(plan_params)
  end
  private
  def plan_params
    params.require(:plan).permit(:user_id, :situation_id, :departure, :shelter, :distance, :duration, :memo)
  end
end
