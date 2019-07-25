require 'uri'
require 'net/http'
require 'json'
require 'simple_command'
require_relative 'Filters'

module Ifep
    class DisplayLawyers
        prepend SimpleCommand
        def initialize(result, params)
            @result = result
            @params = params
        end
        def call
            count  = @params["count"]
            puts count
            counter = 0
            while counter <= count
                puts @result.split('",')[counter]
                counter +=1
            end
        end
    end
end