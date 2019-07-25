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
            uri = URI.parse("https://www.ifep.ro/Account/Login.aspx")
            http = Net::HTTP.new(uri.host, uri.port)
            http.use_ssl = true
            resp = http.request_get(uri.path, @headers)
            cookie = resp['set-cookie']
            return [resp.code, cookie]
        end
    end
end
