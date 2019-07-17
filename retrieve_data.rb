require 'uri'
require 'net/http'
require 'json'

uri = URI.parse("https://www.ifep.ro/Ws/InternalWebServices.asmx/GetLawyers") #url to be parsed
params = { # parameters inside the json body to filter the data
    "prefixText": "",
    "count": 30,
    "contextKey": "null"
}
headers = { # header parameters containing sessionID and json format
    'Content-Type' =>'application/json',
    'Accept'=>'application/json',
    'cookie' => 'ASP.NET_SessionId=pnyjosdmavmytyqhvci1i25b; path=/; HttpOnly'
    }

http = Net::HTTP.new(uri.host, uri.port) #new http class 
puts uri.host # show site host => www.ifep.ro
puts uri.port # show used port => 443
puts uri.path # shows the path => /Ws/InternalWebServices.asmx/GetLawyers
http.use_ssl = true #Turn on/off SSL. This flag must be set before starting session
response = http.post(uri.path, params.to_json, headers) # making a new post request using the path the parameters inside the json body and the header
output = response.body # saving the result inside the outut variable
puts output # printing the output
=begin
{"d":["",
    "",
    "",
    " Adrian Bogdan-Ion, baroul B Bacău |36|",
    "AANEGROAE ANA-MARIA, baroul B Bucureşti |34149|",
    "AANEI Anca-Natalia, baroul B Iaşi |8524|",
    "AANEI BOGDAN, baroul B Bucureşti |20072|",
    "AANEI DUMITRU-BOGDAN, baroul B Bucureşti |21358|",
    "AANEI-BUTNARU Crina-Elena, baroul B Vaslui |30710|",
    "ABABEI Anca-Oana, baroul B Iaşi |3773|",
    "ABABEI Bosinceanu-Constantin, baroul B Botoşani |14852|",
    "ABABEI ECATERINA, baroul B Bucureşti |23342|",
    "ABABEI Gheorghe, baroul B Bacău |8525|",
    "ABABEI Petrea-Irina-Nicoleta, baroul B Bacău |8526|",
    "ABABEI-BOSINCEANU Anca, baroul B Botoşani |30740|",
    "ABAGIU FLORIN, baroul B Bucureşti |17958|",
    "ABAGIU George-Elvis, baroul B Constanţa |2250|",
    "ABAGIU MIHAELA-IRINA, baroul B Bucureşti |22946|",
    "ABAGIU Mihai, baroul B Constanţa |2251|",
    "ABAGIU Minela, baroul B Dolj |12423|",
    "ABAGIU Sachelarie-Calin-Theodor, baroul B Mehedinţi |4837|"
    "ABAGIU Sorin-Costel, baroul B Dolj |35784|",
    "ABALARU ALEXANDRA-IOANA, baroul B Bucureşti |35193|",
    "ABANARITEI Elena, baroul B Vâlcea |5939|",
    "ABAZA Renato-Ricardo-Gabor, baroul B Vaslui |7506|",
    "ABAZA Veronica, baroul B Vaslui |7507|",
    "ABĂNĂRIŢEI Florin, baroul B Vâlcea |7005|",
    "ABĂSEACĂ Marin, baroul B Constanţa |2252|",
    "ABD-ELAZIZ Carla-Emilia, baroul B Iaşi |3774|",
    "ABDELRAZEK CORNELIA-CORINA, baroul B Bucureşti |23611|"]
}
=end
