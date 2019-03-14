require_relative('../db/sql_runner')
require_relative('./performer')

class Movie

  attr_reader :id
  attr_accessor :title, :genre, :budget
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget'].to_i
  end

  def save()
    sql = "INSERT INTO movies (title, genre, budget) VALUES ( $1, $2, $3) RETURNING id"
    values = [@title, @genre, @budget]
    @id = SqlRunner.run(sql, values).first['id']
  end

  def self.all()
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    return movies.map{|movie| Movie.new(movie)}
  end

  def update()
    sql = "UPDATE movies SET (title, genre, budget) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def performers()
    sql = "SELECT performers.*
    FROM performers
    INNER JOIN castings
    ON castings.performer_id = performers.id
    WHERE castings.movie_id = $1"
    values = [@id]
    performers = SqlRunner.run(sql, values)
    return performers.map { |performer| Performer.new(performer)}
  end

end
