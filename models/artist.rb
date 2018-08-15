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

  def albums
    sql = "SELECT * FROM albums
    WHERE artist_id = $1"
    values = [@id]
    albums = SqlRunner.run(sql, values)
    albums.map { |album| album }

  end

  def update
    sql = "UPDATE artists
    SET name = $1
    WHERE id = $2 "
    values = [@name, @id]
    SqlRunner.run(sql, values)

  end

  def delete
    sql = "DELETE FROM artists
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    artists.map { |artist| artist }
  end

  def self.find_by_id(wanted_id)
    sql ="SELECT * FROM artists
    WHERE id = $1"
    values = [wanted_id]
    result = SqlRunner.run(sql, values)

    if result.count > 0
      return result[0]
    else
      return nil
    end
  end


end
