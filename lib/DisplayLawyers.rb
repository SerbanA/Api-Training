require 'uri'
require 'net/http'
require 'json'
require 'simple_command'
require_relative 'Filters'

module Ifep
    def DisplayLawyers(output, params)
        count  = params["count"]
        counter = 0
        while counter <= (count)
         puts output.split('",')[counter]
        counter +=1
        end
    end
end