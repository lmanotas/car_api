require "sequel"

SRID = 4326
QUERY_RADIUS = 1000
DB_NAME ||= 'car_api_dev'
DB ||= Sequel.connect("postgres://localhost/#{DB_NAME}")