require 'uri'
require 'net/http'
require 'json'
require 'simple_command'
require_relative 'Filters'

module Ifep
   class Lawyers
        prepend SimpleCommand

        def initialize(headers,params)
            @headers = headers
            @params = params
        end

        def call
            uri = URI.parse("https://www.ifep.ro/Ws/InternalWebServices.asmx/GetLawyers")
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            response = http.post(uri.path, @params.to_json, @headers)
            output = response.body
        end
    end
end

