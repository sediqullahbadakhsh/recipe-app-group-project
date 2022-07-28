class RecipeFoodsController < ApplicationController
  def index
  end

  def new
    @food = Food.where(user_id: current_user)
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    @food = Food.find(params[:food_id])
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new(recipe_food_params, food_id: @food, recipe_id: @recipe)
    # @recipe_food.food_id = @food
    # @recipe_food.recipe_id = @recipe
    if @recipe_food.save
      flash[:success] = 'Ingredient added'
      redirect_to user_recipe_path
    end
  end

  private
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end

end
