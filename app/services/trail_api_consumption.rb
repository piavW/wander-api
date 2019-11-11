require 'rest-client'
require 'json'

module TrailApi
  def self.get_trails
    unless query == nil
      response = RestClient.get(
        `https://trailapi-trailapi.p.rapidapi.com/trails/explore/?lat=#{latitude}&lon=#{longitude}`,
        {
          params: {
            api_key: Rails.application.credentials.trail_api[:api_key]
          }
        }
      )
    response = JSON.parse(response)
    if response == []
      'error'
    else
      trail
    end
  end
end

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
      latitude = JSON.parse(response.results.locations.latLng.lat)
      longitude = JSON.parse(response.results.locations.latLng.lng)
      if latitude || longitude == nil
        'error'
      else
        latitude, longitude
      end
    end
  end
end

# http://www.mapquestapi.com/geocoding/v1/address
# Consumer Key    api_key
# Consumer Secret api_secret

#   url = URI("https://trailapi-trailapi.p.rapidapi.com/trails/explore/")

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

# request = Net::HTTP::Get.new(url)
# request["x-rapidapi-host"] = 'trailapi-trailapi.p.rapidapi.com'
# request["x-rapidapi-key"] = Rails.application.credentials.trail_api[:api_key]

# response = http.request(request)
# puts response.read_body
# end