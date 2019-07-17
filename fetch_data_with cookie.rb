require 'uri'
require 'net/http'
require 'json'

params = {
    "prefixText": "",
    "count": 30,
    "contextKey": "null"
}
headers = { 
    'Content-Type' =>'application/json',
    'Accept'=>'application/json',
    'cookie' => 'ASP.NET_SessionId=pnyjosdmavmytyqhvci1i25b; path=/; HttpOnly'
}

def fetching_data(params, headers)
 uri = URI.parse("https://www.ifep.ro/Ws/InternalWebServices.asmx/GetLawyers")
 http = Net::HTTP.new(uri.host, uri.port)
 http.use_ssl = true
 response = http.post(uri.path, params.to_json, headers)
 output = response.body
 count  = 0
 while count <= 61
  puts output.split(/["]/)[count]
  count +=1
 end  
end

fetching_data(params, headers)