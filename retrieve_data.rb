require 'uri'
require 'net/http'
require 'net/https'
require 'json'
uri = URI.parse("https://www.ifep.ro/Ws/InternalWebServices.asmx/GetLawyers")
params = {"prefixText": "",
                  "count": 30,
                  "contextKey": "null"}
headers = {
    'Content-Type' =>'application/json',
    'Accept'=>'application/json',
    'cookie' => 'ASP.NET_SessionId=pnyjosdmavmytyqhvci1i25b; path=/; HttpOnly'
    }

http = Net::HTTP.new(uri.host, uri.port)
puts uri.host
puts uri.port
puts uri.path
http.use_ssl = true
response = http.post(uri.path, params.to_json, headers)
output = response.body
puts output
