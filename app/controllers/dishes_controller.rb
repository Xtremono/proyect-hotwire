class DishesController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]

  def index
    @dishes = Dish.all
  end

  def show
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new(dish_params)
    @restaurant = Restaurant.find(params[:restaurant_id])
    @dish.restaurant_id = @restaurant.id
    if @dish.save
      redirect_to dish_path(@dish)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if dish.update(dish_params)
      redirect_to dish_path(@dish)
    else
      render :edit, :unprocessable_entity
    end
  end

  def destroy
    @dish.destroy
  end

  private
  def dish_params
    params.require(:dish).permit(:name, :price, :description, :status)
  end

  def set_dish
    @dish = Dish.find(params[:id])
  end
end
