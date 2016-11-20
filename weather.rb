require 'barometer'


def find_location(location)
  barometer = Barometer.new(location)
  weather = barometer.measure
  # puts weather.forecast.inspect

  # Find today's day number by using strftime method and converting to integer
  today = Time.now.strftime("%d").to_i
  # Find tomorrow's day number by adding 1 to today's date
  tomorrow = today + 1

  # TELL THE USER THE CURRENT TEMPERATURE
  puts "The current temperature in #{location} is #{weather.current.temperature.f} and #{weather.current.icon}."

  # NEXT, LOOP THROUGH THE FORECAST WITH .EACH METHOD
  weather.forecast.each do |forecast|
    # Create a variable for the day of the month number
    day = forecast.starts_at.day
    # Create if/else stmt to compare today's date to tomorrow
    # If it's not tomorrow, then return the day of the week instead
    if day == tomorrow
      dayName = "tomorrow"
    else
      dayName = forecast.starts_at.strftime("%A")
    end

    puts "The forecast for #{dayName} #{forecast.starts_at.month.to_s}-#{forecast.starts_at.day.to_s} will be #{forecast.icon} with a high of #{forecast.high.f} with a low of #{forecast.low.f}."
  end

end

puts "What is your location?"
location = gets.chomp
find_location(location)
