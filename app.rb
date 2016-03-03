require "sinatra"
require "sinatra/jbuilder"
require "json"

ENV["RACK_ENV"] = "development"

require './db/setup'

class CarApi < Sinatra::Base
  
  not_found do
    render_error(404, 'Not Found.')
  end

  private
  def render_error(error_code, msg)
    @error_code = 404
    @msg = msg
    jbuilder :error
  end
end