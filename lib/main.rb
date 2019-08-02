require_relative 'ifep'
require 'nokogiri'

headers = Ifep::Variables.headers
params = Ifep::Variables.params
body = Ifep::Variables.body

def updating_cookie(cookie,headers)
    headers['cookie'] = cookie
    headers
end

def parsing(input)
    document = Nokogiri::HTML(input)
    puts
    job = document.search('h4 span[class^="label label"]')[0].text
    nume = document.search('.col-md-12 h4 [style="font-weight:bold;"]')[0].text
   # barou = document.search('.col-md-12 [class="text-nowrap"]')[0].text
    stare = document.search('h4 span[style^="color:"]')[0].text
    #adress = document.search('.col-md-12 [class="fas fa-map-marker text-red padding-right-sm"]')[0].text
    phone = document.search('.col-md-12 [class="padding-right-md text-primary"]')[0].text
    mail = document.search('.col-md-12 [class="text-nowrap"]')[0].text
    puts job
    puts nume
    #puts barou
    puts stare
   # puts adress
    puts phone
    puts mail
end

command = Ifep::ObtainCookie.call(headers)
#request status 200 if OK ,443 if host not known(socket error), 302 if cookie misssing #401 error with request processing when calling getLawyers (missing cookie)
if command.success?  
    cookie = command.result #session id
    headers = updating_cookie(cookie,headers)
    puts "COMMENCING DATA FETCHING"
    command = Ifep::Lawyers.call(headers, body)
    if command.success?
     lawyers = command.result 
     parsing(lawyers)
     else
     puts command.errors[:fetch_lawyers]
    end
else
puts command.errors[:fetch_cookie]
end




