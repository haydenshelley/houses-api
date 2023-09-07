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

  def show 
    @house = House.find_by(id: params[:id])
    render :show
  end

  def update
    @house = House.find_by(id: params[:id])
    @house.update(
      address: params[:address] || @house.address,
      bedrooms: params[:bedrooms] || @house.bedrooms,
      bathrooms: params[:bathrooms] || @house.bathrooms,
      sqft: params[:sqft] || @house.sqft
    )
    render :show
  end

  def destroy
    @house = House.find_by(id: params[:id])
    @house.destroy
    render json: {message: "deleted"}
  end

end
