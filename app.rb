require 'sinatra'
require 'tilt/erb'
require 'pry'

location = []

get '/' do
  erb :index, locals: { position: nil }
end

post '/location' do
  location = []
  location.push(params[:position])
  erb :index, locals: { position: location }
end
