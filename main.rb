require 'uri'
require 'net/http'
require 'json'
require_relative 'Menu'
require_relative 'Ifep'
require_relative 'Cookie'

params = {
    "prefixText": "",
    "count": 0,
    "contextKey": "null"
}
headers = { 
    'Content-Type' =>'application/json',
    'Accept'=>'application/json',
    'cookie' => '_gat=1'
}
exit = 0

while exit == 0 do
    puts "Name:#{params["prefixText"]}  Number:#{params["count"]}"
    headers["cookie"] = Cookie.get_cookie(headers)
    main_menu
    option = gets.chomp
    case option
        when "1" 
            puts "Name or ID:"
            params["prefixText"] = gets.chomp
            puts ""
        when "2"
            puts "Number of people:"
            params["count"] = gets.to_i
            puts ""
        when "3"
           
            temp_output = Ifep.name_and_id_fetching(params, headers)
            Ifep.name_and_id_displaying(temp_output, params)
            puts ""
        when "4"
            exit = 1
        else puts "Invalid option"  
            puts "" 
    end
end


