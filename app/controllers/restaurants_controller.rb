class RestaurantsController < ApplicationController
before_action :set_restaurant, only: [ :show, :edit, :update, :destroy ]

  def index
    @restaurants = Restaurant.all
  end

  def show
    average_rating(@restaurant) if @restaurant.reviews.any?
  end

  def edit
  end

  def update
    # if @restaurant.valid?
      @restaurant.update(restaurant_params)
      redirect_to restaurant_path(@restaurant)
    # else
    #   render :edit
    # end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def average_rating(restaurant)
    sum = 0
    restaurant.reviews.each do |review|
      sum += review.rating
    end
    @average = sum / restaurant.reviews.size
  end
end
