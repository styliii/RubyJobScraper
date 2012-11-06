# Let's try to implement the save method, which basically interacts with the Database object
# first step?
# Employer's responsibility should include what table it belongs to
require 'sqlite3'

class Employer
  attr_accessor :name, :url, :about

  def initialize(name="", url="", about="")
    @name = name
    @url = url
    @about = about
  end

  def self.table
    @@table ||= "employers"
  end

  def save
    Database.new.insert_record(table, attribute_names, attributes)
  end
end
