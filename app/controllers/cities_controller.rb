class CitiesController < ApplicationController
  def show
    @city = City.find(params[:city])
    @gossips = Gossip.joins(:user).where(:users => {city: @city})
  end
end
