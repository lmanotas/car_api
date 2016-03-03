require "sinatra"
require "sinatra/jbuilder"

require "json"

ENV["RACK_ENV"] = "development"

class CarApi < Sinatra::Base
  get '/' do
    'it works!'
  end
end