class FoodsController < ApplicationController
  def index
    @current_user = current_user
    @user = User.find(params[:user_id])
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def create
    @food = current_user.food.new(food_params)
    @food.user_id = params[:user_id]
    @food.save!
    redirect_to user_foods_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.delete
    redirect_to user_foods_path
  end

  private

  def food_params
    params.require(:foods).permit(:name, :measurement_unit, :price)
  end
end
