require 'uri'
require 'net/http'
require 'simple_command'
require_relative 'Filters'

module Ifep
    class UpdateCookie
        prepend SimpleCommand
        def initialize(cookie_response, headers)
            @cookie_response = cookie_response
            @headers = headers
        end
        def call
            @headers['cookie'] = @cookie_response
            @headers
        end
    end
end

