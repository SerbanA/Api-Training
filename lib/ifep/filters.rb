module Ifep
  class Variables
        def self.params  
            {
            "prefixText": "ana",
            "count": 10,
            "contextKey": "null"
            }
        end
        def self.headers  
            { 
            'Content-Type' =>'application/json',
            'Accept'=>'application/json',
            'cookie' => '_gat=1'
            }  
        end
    end
end

