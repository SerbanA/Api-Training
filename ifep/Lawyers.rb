require 'uri'
require 'net/http'
require 'json'

module Ifep
   class Lawyers
    
        def self.GetLawyers(params, headers)
            uri = URI.parse("https://www.ifep.ro/Ws/InternalWebServices.asmx/GetLawyers")
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            response = http.post(uri.path, params.to_json, headers)
            output = response.body
        end

        def self.DisplayLawyers(output, params)
            count  = params["count"]
            counter = 0
            while counter <= (count)
                puts output.split('",')[counter]
            counter +=1
            end
            puts output 
        end
    end
end