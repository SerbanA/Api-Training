require_relative 'ifep'
headers = Ifep::Variables.headers
params = Ifep::Variables.params
temp = Ifep::Variables.form
body = temp["body"]
def updating_cookie(cookie,headers)
    headers['cookie'] = cookie
    headers
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
     puts lawyers
     else
     puts command.errors[:fetch_lawyers]
    end
else
puts command.errors[:fetch_cookie]
end




