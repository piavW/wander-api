require 'rest-client'
require 'json'

require 'uri'
require 'net/http'
require 'openssl'

url = URI("https://trailapi-trailapi.p.rapidapi.com/trails/explore/")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(url)
request["x-rapidapi-host"] = 'trailapi-trailapi.p.rapidapi.com'
request["x-rapidapi-key"] = '0b7f69347amsh5ec641909aa13e3p1de50ejsn43f99efc1f2a'

response = http.request(request)
puts response.read_body