#abstracted away the employer part of inserting a record
require 'sqlite3'

class Database
  attr_accessor :connection

  def initialize
    @connection = SQLite3::Database.new('jobs.db')
    self.connection.results_as_hash = true
  end

  def insert_record(table, attribute_names, attributes)
    question_marks = Array.new(attribute_names.size, "?").join(", ")
    self.connection.execute("INSERT INTO #{table} (#{attribute_names.join(", ")}) VALUES (#{question_marks})", [attributes])
  end
end
