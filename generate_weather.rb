require 'open-uri'
require 'json'

cities = ["Chicago, IL", "Los Angeles, CA", "Anchorage, AK"]

puts '<!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Weather Chart</title>

    <link rel="stylesheet" href="weather.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.css">
  </head>
  <body>
    <div class="container">'


cities.each do |city|

  url = "http://api.openweathermap.org/data/2.5/weather?q=#{city}&units=imperial"
  safe_url = URI.escape(url)
  json_data = open(safe_url).read
  data = JSON.parse(json_data)
  temperature = data['main']['temp'].to_i

  puts '<div class="col-md-3 chart well"><h2>'
  puts city
  puts '</h2><p class="temperature">'
  puts temperature
  puts '&deg; F</p></div>'

end

puts '</body></html>'




