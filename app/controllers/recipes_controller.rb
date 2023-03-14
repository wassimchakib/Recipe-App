class RecipesController < ApplicationController
  def index
    @recipes = 'List of recipes'
  end

  def show
    @recipe = 'Recipe detail'
  end

  def destroy
    @recipe = Recipe.find_by(user: current_user, id: params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end
