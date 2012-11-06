# Let's try to implement the save method, which basically interacts with the Database object
# second step?
# set what attribute_names and attributes are
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
    attribute_names = ["name", "url", "about"]
    attributes = [self.name, self.url, self.about]
    Database.new.insert_record(self.class.table, attribute_names, attributes)
  end
end
