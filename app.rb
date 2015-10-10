require 'sinatra'
require 'tilt/erb'
require 'haversine'
require 'pry'

require 'HTTParty'
require './locatable.rb'
require './bike_station.rb'
require './metro_station.rb'

class TransitApp
get '/' do
  erb :index, locals: { position: nil }
end

post '/location' do

  lat  = params[:position]["lat"].to_f
  long = params[:position]["long"].to_f

  a = TransitCheck.new(lat, long)
binding.pry
  erb :index, locals: { position: params[:position] }
end
