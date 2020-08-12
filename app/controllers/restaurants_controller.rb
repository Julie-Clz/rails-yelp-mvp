class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit]

  def index
  @restaurants = Restaurant.all
end

def show
end

def new
  @restaurant = Restaurant.new
end

def create
  @restaurant = Restaurant.new(params_resto)
  if @restaurant.save
    redirect_to restaurant_path(@restaurant)
  else
    render :new
  end
end

# def edit
# end
# 
# def update
  # @restaurant.update(params_resto)
  # redirect_to restaurants_path
# end
# 
# def destroy
  # @restaurant.destroy
  # redirect_to restaurants_path
# end

private

def set_restaurant
  @restaurant = Restaurant.find(params[:id])
end

def params_resto
  params.require(:restaurant).permit(:name, :category, :address, :phone_number)
end
end
