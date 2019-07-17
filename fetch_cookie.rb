require 'uri'
require 'net/http'

uri = URI.parse("https://www.ifep.ro/Account/Login.aspx") #url to be parsed
http = Net::HTTP.new(uri.host, uri.port) #new http class
puts uri.host # show site host => ifep.ro
puts uri.port # show used port => 443
http.use_ssl = true #Turn on/off SSL. This flag must be set before starting session
headers = { # headers used 
    'cookie' => '_gat=1' # cookie used to stop the redirection to another page and request a new sessionID cokie
} 
puts uri.path # shows the path => /Account/Login.aspx
resp = http.request_get(uri.path, headers) # making a new get request using the path and the cookie inside the header
puts resp.to_hash # shows the response from the get request
=begin
{
    "cache-control"=>["private"],
    "content-type"=>["text/html; charset=utf-8"],
    "server"=>["Microsoft-IIS/10.0"],
    "set-cookie"=>["ASP.NET_SessionId=qbrhld4tdsxmsn2sce5wgi4y; path=/; HttpOnly"],
    "x-aspnet-version"=>["4.0.30319"],
    "x-powered-by"=>["ASP.NET"],
    "date"=>["Wed, 17 Jul 2019 08:28:41 GMT"],
    "connection"=>["close"],
    "content-length"=>["30608"]}
=end
cookie = resp['set-cookie'] #stores the sessionID from the response in cookie variable
puts cookie # shows the cookie => ASP.NET_SessionId=25tomewy2h4gbr1nypxext4p; path=/; HttpOnly