require 'uri'
require 'net/http'
require 'json'

module Ifep
   class Lawyers
        def GetLawyers(params, headers)
            uri = URI.parse("https://www.ifep.ro/Ws/InternalWebServices.asmx/GetLawyers")
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            response = http.post(uri.path, params.to_json, headers)
            output = response.body
        end
    end
end