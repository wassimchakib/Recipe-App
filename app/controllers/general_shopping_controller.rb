class GeneralShoppingController < ApplicationController
  def index
    @recipe = Recipe.find(params[:recipe_id]) # Select the appropriate recipe
    @foods = Food.where(user: current_user) # Retrieve all foods that the current user have
    @recipe_foods = @recipe.recipe_foods
    @missing_foods = []
    # Loop through the recipe foods and if the quantity is less than what user have, or
    # if the user doesn't own the food, then add it to missing foods
    @recipe_foods.each do |recipe_food|
      @user_food = @foods.select { |food| food.id == recipe_food.food.id }
      next unless @user_food.empty? || recipe_food.quantity > @user_food.first.quantity

      @food_name = recipe_food.food.name
      @quantity = recipe_food.quantity - (@user_food.empty? ? 0 : @user_food.first.quantity)
      @unit = recipe_food.food.measurement_unit
      @price = recipe_food.total_price
      @missing_foods << { name: @food_name, quantity: @quantity.to_s + @unit, price: @price.round(2) }
    end
    @total_price = 0
    @missing_foods.each { |e| @total_price += e[:price] }
  end
end
