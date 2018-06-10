require_relative("../db/sql_runner")

class Film

attr_reader :id
attr_accessor :title, :duration, :age_req, :price


def initialize (options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @duration = options['duration'].to_i
  @age_req = options['age_req'].to_i
  @price = options['price'].to_i
end

def save()
 sql = "INSERT INTO films (title, starting_time, duration, age_req, price) VALUES ($1,$2,$3,$4) RETURNING id"
 values = [@title, @duration, @age_req, @price]
 film = SqlRunner.run(sql, values).first
 @id = film['id'].to_i
end

def customers_booked()
  sql = "SELECT customers.* FROM customers INNER JOIN tickets ON tickets.customer_id = customers.id AND film_id = $1"
  values = [@id]
  customers = SqlRunner.run(sql, values)
  return customers.map{|customer| Customer.new(customer)}
end

def delete()
  sql = "DELETE FROM films WHERE id=$1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.find_with_id(id)
sql= "SELECT * FROM films WHERE id = $1"
values=[id]
return SqlRunner.run(sql, values)[0]
end

def self.delete_by_title(title)
  sql = "DELETE FROM films WHERE title = $1"
  values = [title]
  SqlRunner.run(sql,values)
end

def self.update(title, duration, age_req, price)
  sql = "INSERT INTO films (title, duration, age_req, price) VALUES ($1, $2, $3, $4)"
  values = [title, duration,age_req,price]
  SqlRunner.run(sql, values).first
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
