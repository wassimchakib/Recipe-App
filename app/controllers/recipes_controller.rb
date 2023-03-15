class RecipesController < ApplicationController
  def index
    @recipes = 'List of recipes'
  end

  def show
    @recipe = 'Recipe detail'
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(user_params)
      render json: { public: @recipe.public }
    else
      render @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find_by(user: current_user, id: params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def user_params
    params.require(:recipe).permit(:public)
  end
end
