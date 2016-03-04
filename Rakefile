require "rspec/core/rake_task"
RSpec::Core::RakeTask.new('spec') if defined?(RSpec)
task default: [:spec]

require './db/setup'

namespace :db do
  desc "Creates the database"
  task :create do
    require 'pg'
    PG.connect(dbname: 'postgres').exec("CREATE DATABASE #{DB_NAME}")
    # Adding Postgis extension
    DB.run('CREATE EXTENSION postgis')
  end

  task :drop do
    require 'pg'
    PG.connect(dbname: 'postgres').exec("DROP DATABASE #{DB_NAME}")
  end

  desc "Load Schema"
  task :schema_load, [:version] do |_, args|
    DB.create_table :locations do
      Integer   :vehicleCount
      Float     :latitude
      String    :restrictedP
      String    :description
      Integer   :marketId
      Integer   :locationId
      String    :hasVans
      Float     :longitude
      String    :zipfleetId
      column    :geom, :geometry
    end
    # Setting up index
    DB.run('CREATE INDEX geom_index ON locations USING GIST ( geom )')
  end

  task :seed do
    require 'json'
    data = JSON.parse(File.read('./db/data.json'))['locations']
    # dataset from locations table
    locations = DB[:locations]
    # populate the table
    data.each { |location| locations.insert(location) }
    # Populate geom field
    DB.run("UPDATE locations SET geom = ST_PointFromText ('POINT(' || longitude || ' ' || latitude || ')' , 4326 )")
  end

  task reset: [:drop, :create, :schema_load, :seed] 
end