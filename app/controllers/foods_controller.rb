class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      redirect_to foods_path
    else
      render :new
    end
  end

  def destroy
  end
end
