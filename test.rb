require_relative 'Ifep'





Ifep::ObtainCookie.call(@headers)

puts Ifep::Lawyers.call(@headers, @params)

