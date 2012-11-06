# take out save method because of SRP
require 'sqlite3'
require 'module'

class Employer
  include Attributable, Persistable
  attr_accessor :name, :url, :about

  def initialize(args = {})
    args.each do |key, value|
      self.send("#{key.to_sym}=", value)
    end
  end

  def self.table
    @@table ||= "employers"
  end
end
