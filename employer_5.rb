# refactor so that it's abstract, and open to future changes
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
    attribute_names = self.instance_variables.map do |var|
        var.to_s.sub("@", "")
      end
    attributes = attribute_names.map do |att_name|
        self.send(att_name.to_sym)
      end
    Database.new.insert_record(self.class.table, attribute_names, attributes)
  end
end
