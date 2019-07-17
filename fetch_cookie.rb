require 'uri'
require 'net/http'

uri = URI.parse("https://www.ifep.ro/Account/Login.aspx")
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
headers = {
    'cookie' => '_gat=1'
}

resp = http.request_get(uri.path, headers)
puts resp.to_hash


cookie = resp['set-cookie']

puts cookie