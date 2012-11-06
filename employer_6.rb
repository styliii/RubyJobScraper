# single responsibility principle for save method?
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

  def attribute_names
    self.instance_variables.map do |var|
        var.to_s.sub("@", "")
      end
  end

  def attributes
    attribute_names.map do |att_name|
        self.send(att_name.to_sym)
      end
  end
end
