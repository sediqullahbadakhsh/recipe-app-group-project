class FoodsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def new
    @user = current_user
    @food = Food.new
  end

  def create
    @food = current_user.food.new(food_params)
    @food.user_id = params[:user_id]
    if @food.save!
      flash[:notice] = 'Food created successfully!'
      redirect_to user_foods_path
    else
      flash[:alert] = 'Food Already exist!'
      render 'new'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    if @food.delete
      flash[:notice] = 'Food deleted successfully!'
      redirect_to user_foods_path
    else
      flash[:alert] = 'Food used in Recipe'
    end
  end

  private

  def food_params
    params.require(:foods).permit(:name, :measurement_unit, :price)
  end
end
