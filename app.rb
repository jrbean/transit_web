require 'sinatra'
require 'tilt/erb'
require 'pry'

location = []

get '/' do
  erb :index, locals: { position: nil }
end

post '/location' do
  location = params[:position]

  erb :index, locals: { position: location }
end
