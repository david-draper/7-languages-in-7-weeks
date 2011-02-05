
#ARGV.each{|arg| puts "Arg: #{arg}; "}

regex = ARGV[0]
filename = ARGV[1]
line_number = 0


myfile = File.open(filename, "r") 

myfile.each_line do|line| 
  line_number = line_number + 1

  if line.match(regex)
    puts "Match on line #{line_number} : #{line}"
  end
  
end


myfile.close


