class CarQuery
  SRID = 4326
  QUERY_RADIUS = 1000

  attr_reader :location, :lon, :lat

  class BadRequestError < StandardError;end

  def initialize(location)
    @location = location
  end

  def cars_near
    lon_lat_for_query
    query = "ST_DWithin(geog, ST_SetSRID(ST_MakePoint(#{lon}, #{lat}), #{SRID})::geography, #{QUERY_RADIUS})"
    DB[:locations].where(query).to_a
  end

  private
  def lon_lat_for_query
    raise BadRequestError.new(), 'Bad Parameters' if location.nil? || location == ''
    @lat, @lon = separate_lon_lat
  end

  def separate_lon_lat
    lat_lon_array = location.split(',')
    raise BadRequestError.new(), 'Bad Parameters Format' if lat_lon_array.size < 2
    lat_lon_array
  end
end