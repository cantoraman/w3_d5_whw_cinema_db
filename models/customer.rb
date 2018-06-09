require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :age


def initialize (options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @age = options['age'].to_i
end


def save()
  sql="INSERT INTO customers (name, age) VALUES ($1, $2) RETURNING id"
  values = [@name, @age]
  customer=SqlRunner.run(sql, values).first
  @id=customer['id'].to_i
end

def booked_films()
  sql= "select films.* from films inner join tickets on tickets.film_id=films.id AND customer_id=$1;"
  values = [@id]
  films=SqlRunner.run(sql, values)
  return films.map{ |film| Film.new (film)}
end


def self.update_name(new_name,id)
  sql="UPDATE customers SET name = $1 WHERE id = $2"
  values=[new_name, id]
  SqlRunner.run(sql, values)
end



def self.update(name, age)
  sql = "INSERT INTO customers (name, age) VALUES ($1, $2)"
  values = [name, age]
  SqlRunner.run(sql, values)
end


def self.all()
  sql = "SELECT * FROM customers"
  customers=SqlRunner.run(sql)
  return customers.map{ |customer| Customer.new(customer)}
end

def self.delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end

end
