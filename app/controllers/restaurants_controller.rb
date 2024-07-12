class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end
  def show
    @restaurant = Restaurant.find(params[:id])
  end
  def new
    @restaurant = Restaurant.new
  end
  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      respond_to do |format|
        format.html { redirect_to restaurants_path }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
  end
  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @restaurant.destroy
    respond_to do |format|
    format.html { redirect_to restaurants_path, :see_other }
    format.turbo_stream
  end
end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
