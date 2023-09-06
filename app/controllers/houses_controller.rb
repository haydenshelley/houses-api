class HousesController < ApplicationController
  def index
    @houses = House.all 
    render :index
  end

  def create
    @house = House.create(
      sqft: params[:sqft],
      bedrooms: params[:bedrooms],
      bathrooms: params[:bathrooms],
      address: params[:address]
    )
    render :show
  end
end
