require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # ...
    heredoc = <<-SQL
      SELECT
        *
      FROM
        #{table_name}
      LIMIT
        1
    SQL
    @columns ||= (DBConnection.execute2(heredoc).first.map(&:to_sym))
    
  end

  def self.finalize!
    columns.each do |column|
      
      define_method(column) { attributes[column] }
      define_method("#{column}=") { |value| attributes[column] = value }
      
    end
    
  end

  def self.table_name=(table_name)
    # ...
    @table_name = table_name
  end

  def self.table_name
    # ...
    # debugger
    @table_name || self.to_s.downcase + "s"
  end

  def self.all
    # ...
    data = DBConnection.execute (<<-SQL)
      SELECT
        #{table_name}.*
      FROM 
        #{table_name}
    SQL
    
    data
    # data.map { |dat| self.new(dat) }
    # debugger
    self.parse_all(data)
  end

  def self.parse_all(results)
    # ...
    # debugger
    results.map do |dat| 
      # dat[:id] = idx + 1
      self.new(dat)
    end
  end

  def self.find(id)
    # ...
    data = DBConnection.execute (<<-SQL)
    SELECT 
      *
    FROM 
      #{table_name}
    WHERE 
      id = #{id}
    SQL
    return nil if data.empty?
    self.new(data.first)
  end

  def initialize(params = {})
    # ...
    params.each do |att, val|
      unless self.class.columns.include?(att.to_sym)
        raise "unknown attribute '#{att}'"
      else 
        self.send("#{att}=", val) 
      end 
      
        
    end
  end

  def attributes
    # ...
    @attributes ||= {}
  end

  def attribute_values
    # ...
    # columns.each { |col| @attributes[col] = nil }
    self.class.columns.map {|col| send("#{col}")}
  end

  def insert
    # ...
    col_names = self.class.columns.join(", ")
    question_mark = ["?"] * self.class.columns.length 
    question_marks = question_mark.join(", ")
    DBConnection.execute(<<-SQL, *attribute_values)
      INSERT INTO
        #{self.class.table_name} \(#{col_names}\)
      VALUES
        \(#{question_marks}\)
    SQL
    # debugger
    self.id = DBConnection.last_insert_row_id
  end

  def update
    # ...
  end

  def save
    # ...
  end
  
  # self.class.superclass.finalize!
end
