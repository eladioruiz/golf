require "google_geocode"

class LocationController < ApplicationController
  def index
    if params.nil?
      coordinates = [40.4832585,-3.3930496]
    end

    unless params.nil?
      coordinates = [40.4832585,-3.3930496]
      #-new_location = params[:new_location]
      #-@new_location = params[:new_location]
      #gg = GoogleGeocode.new("ABQIAAAArY0YLQLROMFjY013kjH03xTJQa0g3IQ9GZqIMmInSLzwtGDKaBTGgno8Rw_245czFEW9TYW7uOZ40Q")

      #-gg_locate = Geokit::Geocoders::GoogleGeocoder.geocode(new_location)
      #-coordinates = [gg_locate.lat, gg_locate.lng]
      #coordinates = [31.8921254,-87.6096669]
    end
    #coordinates = [31.8921254,-87.6096669]

    @coordinates = coordinates
    
    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,14)
    @map.overlay_init(GMarker.new(coordinates,:title => "Navy Pier", :info_window => "Navy Pier"))

  end

  def create
    new_location = params[:new_location]
    @debug = "1"
    @newlocation = params[:new_location]

    # www.mygolfcard.es => ABQIAAAArY0YLQLROMFjY013kjH03xRBDHnb3bza1JRZQvJuX_hSE_IbCxSvGFVULxef8w3sF3Y45KlYzd1erg
    # dev.mygolfcard.es => ABQIAAAArY0YLQLROMFjY013kjH03xQMMeIXQUaBI2XMV44zdwgO36Uk7xQurmAjUrHMilGbuVRhB29AoGSKtQ
    # localhost:3000 => ABQIAAAArY0YLQLROMFjY013kjH03xTJQa0g3IQ9GZqIMmInSLzwtGDKaBTGgno8Rw_245czFEW9TYW7uOZ40Q
    gg = GoogleGeocode.new("ABQIAAAArY0YLQLROMFjY013kjH03xQMMeIXQUaBI2XMV44zdwgO36Uk7xQurmAjUrHMilGbuVRhB29AoGSKtQ")
    gg_locate = gg.locate(new_location)

    @debug = "2"

    coordinates = [gg_locate.latitude, gg_locate.longitude]
    @coordinates = 'pp'

    @debug = "3"

    @map = GMap.new("map")
    @map.control_init(:large_map => true, :map_type => true)
    @map.center_zoom_init(coordinates,14)
    @map.overlay_init(GMarker.new(coordinates, :title => 'pp' + new_location, :info_window => new_location))

    render :action => "index", :method => "put"
  end

  layout "frontend"

end
