require "pry"
require "did_you_mean"
require "httparty"
require "haversine"

require "./locatable"
require "./metro_station"
require "./bike_station"

CLOSE_RADIUS = 1

class TransitCheck

  def initialize (lat=38.903192, long=-77.039766)
    @lat  = lat
    @long = long
  end

  def station_results
    bikes  = BikeStation.near(@lat, @long)
    metros = MetroStation.near(@lat, @long)
    all_stations = (bikes + metros).sort_by { |s| s.distance_to(lat, long) }
    all_stations.each do |station|
      title = "#{station.name} (#{station.distance_to(lat, long).round(2)} mi)"
      return title
      # puts "=" * title.length
      #
      # puts station.extra_detail
      # puts
      end
    end
end
