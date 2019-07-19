require 'uri'
require 'net/http'

module Cookie
    def self.get_cookie(headers)
        uri = URI.parse("https://www.ifep.ro/Account/Login.aspx")
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        resp = http.request_get(uri.path, headers)
        resp['set-cookie']
    end
end