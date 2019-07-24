require_relative 'Ifep'

headers = Ifep::Variables.class_variable_get( :@@headers)
params = Ifep::Variables.class_variable_get( :@@params)

command = Ifep::ObtainCookie.call(headers)
cookie = command.result
puts cookie
puts "FETCHING SESSION-ID DONE"
command = Ifep::UpdateCookie.call(cookie, headers)
headers = command.result
puts headers
puts "UPDATING COOKIE WITH SESSION-ID DONE"
command = Ifep::Lawyers.call(headers, params)
lawyers = command.result
puts lawyers
puts "FETCHING LAWYERS DONE"
