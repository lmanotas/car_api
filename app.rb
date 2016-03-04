require "sinatra"
require "sinatra/jbuilder"
require "json"

ENV["RACK_ENV"] = "development"

require './db/setup'
require './car_query'

class CarApi < Sinatra::Base

  get '/cars' do
    begin 
      @cars = CarQuery.new(params[:location]).cars_near
      jbuilder :cars
    rescue CarQuery::BadRequestError => e
      render_error(code: 400, msg: e.message)
    rescue Sequel::DatabaseError => e
      render_error(code: 500, msg: "Internal Error")
    end
  end
  
  not_found do
    render_error(code: 404, msg: 'Not Found.')
  end

  private
  def render_error(options = {})
    @error_code = options[:code]
    @msg = options[:msg]
    jbuilder :error
  end
end