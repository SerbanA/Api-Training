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

=begin
headers["cookie"] = Cookie.get_cookie(headers)
params["prefixText"] = gets.chomp
params["count"] = gets.to_i
=end