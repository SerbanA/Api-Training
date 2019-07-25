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
            uri = URI.parse("https://www.ifep.ro/Ws/adaswqInternalWebServices.asmx/GetLawyers")
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            response = http.post(uri.path, @params.to_json, @headers)
            status = response.code
            response.body if status == "200"

            errors.add(:fetch_lawyers, error_message(response))
            nil
        end

        def error_message(response)
         "Error when fetching lawyers list.#{response.code}:#{JSON.parse(response.body)["Message"]}" 

        end
    end
end

