class PlacesController < ApplicationController

  def index
    @places = Place.where.not(latitude: nil, longitude: nil)

    # the `geocoded` scope filters only places with coordinates (latitude & longitude)
    @markers = @places.geocoded.map do |place|
      {
        id: place.id,
        lat: place.latitude,
        lng: place.longitude,
        name: place.name,
        address: place.address,
        url: place.url,
        img: place.photo_url
      }
    end

    @google_api_key = ENV['GMAPS_API_BROWSER_KEY']

    if @places.count.zero?
      @map_center = [35.6762, 139.6503] # Tokyo
      @map_zoom = 0
    elsif @places.count == 1
      @map_center = [@places[0].latitude, @places[0].longitude]
      @map_zoom = 14
    else
      avg_lat = 0
      avg_lon = 0

      @places.map do |place|
        avg_lat += place.latitude
        avg_lon += place.longitude
      end

      @map_center = [(avg_lat / @places.count), (avg_lon / @places.count)]
      @map_zoom = 12
    end

  end

  def new
  end
end
