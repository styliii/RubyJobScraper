# take out save method because of SRP
require 'sqlite3'
require 'module.rb'

class Employer
  include Attributable, Persistable
  attr_accessor :name, :url, :about

  def initialize(name="", url="", about="")
    @name = name
    @url = url
    @about = about
  end

  def self.table
    @@table ||= "employers"
  end
end
