class GeneralShoppingController < ApplicationController
  def index
    @shopping_list = 'hello'
    # Pick all recipes food list for the current user
    # Compare Food list with recipes food list
    # @recipes_food = RecipeFood.find(user: current_user).foods
    # @foods = current_user.foods
    # if @recipes_food.quantity > foods.quantity ==> show it on table
  end
end
