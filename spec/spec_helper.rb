ENV["RACK_ENV"] = "test"

require 'rspec'
require 'rack/test'
require 'sequel'
require './app'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  CarApi
end