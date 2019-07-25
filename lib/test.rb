require_relative 'ifep'

headers = Ifep::Variables.headers
params = Ifep::Variables.params

def updating_cookie(cookie,headers)
    headers['cookie'] = cookie
    headers
end

command = Ifep::ObtainCookie.call(headers)
cookie = command.result[1] #session id
request_status = command.result[0] #request status 200 if OK ,443 if host not known(socket error), 302 if cookie misssing 
if (command.success? && request_status == '200')
    puts "FETCHING SESSION-ID DONE"
    headers = updating_cookie(cookie,headers)
    puts "COMMENCING DATA FETCHING"
end

command = Ifep::Lawyers.call(headers, params)#401 error with request processing when calling getLawyers (missing cookie)
lawyers = command.result 
puts lawyers
puts "FETCHING LAWYERS DONE"


