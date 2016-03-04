require "sinatra"
require "sinatra/jbuilder"
require "json"

ENV["RACK_ENV"] = "development"

require './db/setup'

class CarApi < Sinatra::Base

  post '/cars' do
    # TODO: refactor this and extract in in a lib/ or Location model.
    lon, lat = lon_lat_query
    
    query = "ST_DWithin(geom, ST_SetSRID(ST_Point(#{lon}, #{lat}), #{SRID}), 30000)"
    @cars = DB[:locations].where(query).limit(10).to_a
    jbuilder :cars
  end
  
  not_found do
    render_error(404, 'Not Found.')
  end

  private
  def render_error(error_code, msg)
    @error_code = 404
    @msg = msg
    jbuilder :error
  end

  def lon_lat_query
    params[:location].split(',')
  end
end