require 'net/http'
require 'rubygems'
require 'json'
require 'pry'

module Weather
  Key = '716a3eaec665ff95'

  def self.find_by_zipcode(code='94107')
    uri = URI("http://api.wunderground.com/api/#{Key}/forecast10day/q/#{code}.json")
    response = Net::HTTP.get_response(uri)
    parse_response(JSON.parse(response.body))
  end
  def self.parse_response(response)
    days = response['forecast']["simpleforecast"]['forecastday']
    days.each do |day|
      if(day['date']['weekday'] == "Saturday" || day['date']['weekday'] == "Sunday" )
        puts day['date']['weekday']
        puts "---------------------------------"
        puts "Conditions: " + day["conditions"].to_s
        puts "High:fahrenheit: " + day["high"]['fahrenheit'].to_s
        puts "High:celsius: " + day["high"]['celsius'].to_s
        puts "Low:fahrenheit: " + day["low"]['fahrenheit'].to_s
        puts "Low:celsius: " + day["low"]['celsius'].to_s
        puts "avehumidity: " + day["avehumidity"].to_s
        puts "---------------------------------"
      end
    end
  end
end
code = ARGV[0].to_i
Weather.find_by_zipcode(code)