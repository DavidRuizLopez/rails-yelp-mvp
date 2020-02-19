class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    find
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(user_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
    find
  end

  def update
    find
    @restaurant.update(user_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    find
    @restaurant.destroy
    redirect_to restaurants_path(@restaurants)
  end

  private

  def find
    @restaurant = Restaurant.find(params[:id])
  end

  def user_params
    params.require(:restaurant).permit(:name, :category, :phone_number, :address)
  end
end
