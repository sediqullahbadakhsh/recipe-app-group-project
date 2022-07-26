class RecipesController < ApplicationController
    def index
        @user = User.find(params[:user_id])
    end
    def show
        @user = User.find(params[:user_id])
    end

    def new
        @user = current_user
        @recipe = Recipe.new
    end

    def create
        @recipe = current_user.recipes.new(recipe_params)
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

end
