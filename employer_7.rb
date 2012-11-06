# take out attribute methods and place in module
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
    Database.new.insert_record(self.class.table, self.attribute_names, self.attributes)
  end
end
