#!/usr/bin/ruby

my_number = rand(10);

puts "I've got a number (#{my_number}), guess what it is >"

while my_number != (guess = gets.to_i) do
  if guess > my_number
    puts "Lower than #{guess}"
  else
    puts "Higher than #{guess}"
  end
end  
puts "well done"

