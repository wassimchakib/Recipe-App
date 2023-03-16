class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      flash[:success] = 'Recipe saved successfully'
      redirect_to recipes_path
    else
      flash[:error] = "Invalid input, recipe didn't get saved"
      render :new
    end
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

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description,
                                   :public).merge(user: current_user)
  end
end
