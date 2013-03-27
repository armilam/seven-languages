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

    def each
      self.csv_contents.each do |row|
        csv_row = CsvRow.new self.headers, row
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
  attr_accessor :headers
  attr_accessor :row

  def initialize headers, row
    self.headers = headers
    self.row = row
  end

  def method_missing name, *args
    index = self.headers.index name.to_s
    self.row[index]
  end
end

m = RubyCsv.new
puts m.headers.inspect
puts m.csv_contents.inspect
m.each { |row| puts row.one }
