require 'rest-client'
require 'json'

module GeoCodeAdress
  def self.get_goecode(query)
    unless query == nil
      response = RestClient.get(
        'http://www.mapquestapi.com/geocoding/v1/address',
        {
          params: {
            api_key: Rails.application.credentials.mapquest_api[:api_key]
            geo: query
          }
        }
      )
      binding.pry
      latitude = JSON.parse(response.results.locations.latLng.lat)
      longitude = JSON.parse(response.results.locations.latLng.lng)
      if latitude == nil || longitude == nil
        'error'
      else
        latitude, longitude
      end
    end
  end
end

module TrailApi
  def self.get_trails
    unless query == nil
      response = RestClient.get(
        `https://www.hikingproject.com/data/get-trails?#{latitude}&lon=#{longitude}&maxDistance=1000000&key=#{api_key}`,
        {
          params: {
            api_key: Rails.application.credentials.trail_api[:api_key]
          }
        }
      )
      binding.pry
    response = JSON.parse(response)
    if response == []
      'error'
    else
      trail
    end
  end
end

# MAPQUEST API.....
# http://www.mapquestapi.com/geocoding/v1/address
# Consumer Key    api_key
# Consumer Secret api_secret
# Hiking Project API.......
# https://www.hikingproject.com/data 
# api_key