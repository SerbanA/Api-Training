require_relative 'Ifep'

headers = Ifep::Variables.class_variable_get( :@@headers)
params = Ifep::Variables.class_variable_get( :@@params)

command = Ifep::ObtainCookie.call(headers)
cookie = command.result
puts cookie
puts "getting cookie DONE"
command = Ifep::UpdateCookie.call(cookie, headers)
header = command.result
puts header
puts "updating cookie DONE"

