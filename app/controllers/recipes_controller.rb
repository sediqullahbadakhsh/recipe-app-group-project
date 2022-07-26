class RecipesController < ApplicationController
  def index
    @user = User.includes(:recipe).find(params[:user_id])
  end

  def show
    @user = User.includes(:recipe).find(params[:user_id])
    @recipe = @user.recipe.includes(:recipe_foods).find(params[:id])
    @current_user = current_user
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipe.new(recipe_params)
    @recipe.user_id = params[:user_id]
    respond_to do |format|
      if @recipe.save!
        format.html do
          redirect_to user_recipe_path(@recipe.user_id, @recipe.id), notice: 'Recipe created successfully!'
        end
      else
        format.html { redirect_to new_user_recipes_path, alert: 'Failed to create recipe' }
      end
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy!
    redirect_to user_recipes_path, notice: 'Recipe deleted successfully!'
  end

  private

  def recipe_params
    params.require(:recipes).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
