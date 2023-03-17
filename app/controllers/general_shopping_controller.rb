class GeneralShoppingController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id])
    @missing_foods = []
    # Loop through the recipe foods and if the quantity is less than what user have, then add it to missing foods
    @recipe.recipe_foods.each do |recipe_food|
      next unless recipe_food.quantity > recipe_food.food.quantity

      @food_name = recipe_food.food.name
      @quantity = recipe_food.quantity - recipe_food.food.quantity
      @unit = recipe_food.food.measurement_unit
      @price = recipe_food.food.price
      @missing_foods << { name: @food_name, quantity: @quantity.to_s + @unit, price: @price }
    end

    @total_price = 0
    @missing_foods.each { |e| @total_price += e[:price] }
  end
end
