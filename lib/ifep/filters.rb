module Ifep
  class Variables
        def self.params  
            {
            "prefixText": "ana",
            "count": 30,
            "contextKey": "null"
            }
        end
        def self.headers  
            { 
            'Content-Type' =>'application/json',
            'Accept'=>'application/json',
            'cookie' => '_gat1_'
            }  
        end
    end
end

