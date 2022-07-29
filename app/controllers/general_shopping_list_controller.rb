class GeneralShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @items = @user.food.length
    @total_price = 0
  end
end
