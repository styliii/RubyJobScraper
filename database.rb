# refactored the class variable so that it's a data attribute

require 'sqlite3'

class Database
  attr_accessor :connection

  def initialize
    @connection = SQLite3::Database.new('jobs.db')
    self.connection.results_as_hash = true
  end

  def insert_employer
    self.connection.execute("INSERT INTO employers (name, url, about) VALUES (?, ?, ?)", [@name, @url, @about])
  end
end
