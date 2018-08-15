require('pg')
require_relative('sql_runner')

class Artist
  attr_reader :id
  attr_accessor :name

  def initialize(info)
    @id = info['id'].to_i if info['id']
    @name = info['name']
  end

  def save()
    sql = "INSERT INTO artists (name)
    VALUES ($1)
    RETURNING *"
    values =[@name]
    result = SqlRunner.run(sql, values)
    @id = result[0]['id'].to_i
  end
end
