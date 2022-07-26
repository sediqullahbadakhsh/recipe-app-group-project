class FoodsController < ApplicationController
  def index
    @current_user = current_user
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @current_user = current_user
    @food = @current_user.foods.new(food_params)
    @food.save
    redirect_to foods_path
  end

  def destroy
    @food = Food.find(params[:id])
    @food.delete
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
