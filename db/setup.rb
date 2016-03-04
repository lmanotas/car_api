require "sequel"

SRID = 4326
DB_NAME ||= 'car_api_dev'
DB ||= Sequel.connect("postgres://localhost/#{DB_NAME}")