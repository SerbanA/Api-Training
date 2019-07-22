require 'uri'
require 'net/http'
require 'json'

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