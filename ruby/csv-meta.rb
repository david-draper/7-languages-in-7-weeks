module ActsAsCsv

  def self.included(base) base.extend ClassMethods
  end

  module ClassMethods 
    def acts_as_csv
      include InstanceMethods
    end 
  end

  module InstanceMethods
    def read 
      @csv_contents = [] 
      filename = self.class.to_s.downcase + '.txt' 
      file = File.new(filename) 
      @headers = file.gets.chomp.split(', ')
      
      file.each do |row| 
        @csv_contents << row.chomp.split(', ')
      end
    end
    
    attr_accessor :headers, :csv_contents
    
    def each(&block)
      @csv_contents.each do |row|
        block.call CsvRow.new(@headers, row)
      end
    end

    def initialize
      read
    end
  end
end

class CsvRow
  def initialize headers, row
    @headers = headers
    @row = row
    @map = {}
    
    0.upto @headers.size - 1 do |i|
      @map[@headers[i].to_sym] = @row[i]
    end
  end
  
  def method_missing name, *args
    @map[name]
  end
end

class RubyCsv # no inheritance! You can mix it in 
  include ActsAsCsv
  acts_as_csv
end

m = RubyCsv.new 
puts m.headers.inspect 
puts m.csv_contents.inspect

csv = RubyCsv.new 

csv.each {|row| puts row.one}