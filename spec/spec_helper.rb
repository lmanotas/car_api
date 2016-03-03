ENV["RACK_ENV"] = "test"

require 'rspec'
require 'sequel'
require 'rack/test'

RSpec.configure do |config|
  config.include Rack::Test::Methods
end

def app
  CarApi
end