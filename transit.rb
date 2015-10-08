require "pry"
require "did_you_mean"
require "httparty"
require "haversine"

require "./locatable"
require "./station"
require "./bike_station"

CLOSE_RADIUS = 1

# puts "Where are you?"
# lat  = gets.chomp
# long = gets.chomp

lat  =  38.903192
long = -77.039766

bikes  = BikeStation.near(lat, long)
metros = Station.near(lat, long)

all_stations = (bikes + metros).sort_by { |s| s.distance_to(lat, long) }
all_stations.each do |station|
  title = "#{station.name} (#{station.distance_to(lat, long).round(2)} mi)"
  puts title
  puts "=" * title.length

  puts station.extra_detail
  puts
end
