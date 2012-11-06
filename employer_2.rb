require 'sqlite3'

class Employer
  attr_accessor :name, :url, :about

  def initialize(name="", url="", about="")
    @name = name
    @url = url
    @about = about
  end
end

class Database
  @@db ||= SQLite3::Database.new('jobs.db')
  @@db.results_as_hash = true

  def insert_employer
    @@db.execute("INSERT INTO employers (name, url, about) VALUES (?, ?, ?)", [@name, @url, @about])
  end
end
