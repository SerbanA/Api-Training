require 'uri'
require 'net/http'
require 'json'

def name_and_id_fetching(params, headers)
    uri = URI.parse("https://www.ifep.ro/Ws/InternalWebServices.asmx/GetLawyers")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    response = http.post(uri.path, params.to_json, headers)
    output = response.body

    contor  = params["count"]
    counter = 0
    while counter <= (contor*2 + 1)
        puts output.split(/[";]/)[counter]
     counter +=1
    end
end