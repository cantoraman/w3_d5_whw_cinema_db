require_relative("../db/sql_runner")
require_relative("film")
class Screening

attr_reader :id
attr_accessor :film_id, :starting_time, :salon_number, :salon_capacity

def initialize (options)
  @id = options['id'].to_i if options['id']
  @film_id = options['film_id'].to_i
  @starting_time = options['starting_time']
  @salon_number = options['salon_number']
  @salon_capacity = options ['salon_capacity']
end

def save()
sql="INSERT INTO screenings (film_id, ticket_id,  starting_time, salon_number, salon_capacity) VALUES ($1,$2, $3,$4) RETURNING id"
values=[@film_id,@starting_time, @salon_number, @salon_capacity]
screening=SqlRunner.run(sql, values).first
@id = screening['id'].to_i
end

def film_title()
  sql= "select films.title from films inner join screenings on screenins.film_id=films.id AND screening_id=$1;"
  values = [@id]
  film=SqlRunner.run(sql, values).first
  return Film.new (film)
end


def self.find_with_id(id)
sql= "SELECT * FROM screenings WHERE id = $1"
values=[id]
return SqlRunner.run(sql, values)[0]
end


def self.update(film_id, starting_time, salon_number, salon_capacity)
  sql = "INSERT INTO screenings (film_id, starting_time, salon_number, salon_capacity) VALUES ($1,$2, $3,$4,$5)"
  values=[@film_id, @starting_time, @salon_number, @salon_capacity]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM screenings"
  screenings=SqlRunner.run(sql)
  return screenings.map{ |screening| Screening.new(screening)}
end

def self.delete_all()
  sql = "DELETE FROM screenings"
  SqlRunner.run(sql)
end



end
