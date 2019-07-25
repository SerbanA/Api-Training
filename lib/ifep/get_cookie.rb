require 'uri'
require 'net/http'
require 'simple_command'
require_relative 'Filters'

module Ifep
    class ObtainCookie
        prepend SimpleCommand
        def initialize(headers)
            @headers = headers
        end
        def call
            uri = URI.parse("https://www.ifep.ro/Aaccount/Login.aspx")
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            resp = http.request_get(uri.path, @headers)
            status = resp.code
            puts status
            return resp['set-cookie'] if status == "200" 

            errors.add(:fetch_cookie,  error_message(resp))
            nil            
        end

        def error_message(resp)
            "Error when fetching session ID.#{resp.code}:#{(resp.body)}" 
        end
    end
end