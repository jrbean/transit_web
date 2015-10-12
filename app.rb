require 'sinatra/base'
require 'tilt/erb'
require 'haversine'
require 'pry'

require 'HTTParty'
require './locatable.rb'
require './transit.rb'

class TransitApp < Sinatra::Base
  include Enumerable
get '/' do
  erb :index, locals: { position: nil }
end

post '/location' do

  lat  = params[:position]["lat"].to_f
  long = params[:position]["long"].to_f

  a = TransitCheck.new(lat, long)

  @results = a.station_results
  
  erb :index, locals: { position: @results }
  end

end

TransitApp.run!
