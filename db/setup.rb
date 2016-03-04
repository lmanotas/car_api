require "sequel"

DB_NAME ||= 'car_api_dev'
DB ||= Sequel.connect("postgres://localhost/#{DB_NAME}")