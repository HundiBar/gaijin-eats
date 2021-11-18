class PlacesController < ApplicationController

  def index
    @places = Place.all.where.not(longitude: nil, latitude:nil)
  end
end
