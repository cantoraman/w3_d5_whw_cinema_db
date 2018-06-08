require_relative("../db/sql_runner")

class Film

attr_reader :id
attr_accessor :title, :starting_time, :duration, :age_req, :price


def initialize (options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @starting_time = (options['starting_time'])
  @duration = options['duration'].to_i
  @age_req = options['age_req'].to_i
  @price = options['price'].to_i
end

def save()
 sql = "INSERT INTO films (title, starting_time, duration, age_req, price) VALUES ($1,$2,$3,$4, $5) RETURNING id"
 values = [@title, @starting_time, @duration, @age_req, @price]
 film = SqlRunner.run(sql, values).first
 @id = film['id'].to_i
end


def self.update(title, starting_time, duration, age_req, price)
  sql = "INSERT INTO films (title, starting_time, duration, age_req, price) VALUES ($1, $2, $3, $4, $5)"
  values = [title, starting_time,duration,age_req,price]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM films"
  films=SqlRunner.run(sql)
  return films.map{ |film| Film.new(film)}
end

def self.delete_all()
  sql = "DELETE FROM films"
  SqlRunner.run(sql)
end







end
