class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.find_by(name: recipe_food_params['name'],
                         measurement_unit: recipe_food_params['measurement_unit'])

    # If food doesn't exist
    if @food.nil?
      # Create Food first with 0 quantity
      @food = Food.new(recipe_food_params)
      @food.user = current_user
      @food.quantity = 0
      if @food.save
        @recipe_food = RecipeFood.new(quantity: recipe_food_params['quantity'],
                                      food: @food, recipe: @recipe)
        save_recipe_food(@recipe_food)
      else
        flash[:error] = "Invalid input, Food didn't get saved"
        render :new
      end
    else
      @recipe_food = RecipeFood.new(quantity: recipe_food_params['quantity'],
                                    food: @food, recipe: @recipe)
      save_recipe_food(@recipe_food)
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:name, :measurement_unit, :price, :quantity)
  end

  def save_recipe_food(recipe_food)
    if recipe_food.save
      flash[:success] = 'Recipe food saved successfully'
      redirect_to recipe_path(params[:recipe_id])
    else
      flash[:error] = "Invalid input, recipe didn't get saved"
      render :new
    end
  end
end
