module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
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
    def initialize
      read 
    end

# Exercise for day 3
    def each
      self.csv_contents.each do |row|
        csv_row = CsvRow.new Hash[self.headers.zip(row)]
        yield csv_row
      end
    end
  end
end

class RubyCsv  # no inheritance! You can mix it in
  include ActsAsCsv
  acts_as_csv
end

class CsvRow
  attr_accessor :row

  def initialize row
    self.row = row
  end

  def method_missing name, *args
    self.row[name.to_s]
  end
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect

# Test for exercise for day 3
m.each { |row| puts row.two }
