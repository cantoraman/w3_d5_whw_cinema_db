require_relative("../db/sql_runner")

class Customer

  attr_reader :id,:funds
  attr_accessor :name, :age


def initialize (options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @age = options['age'].to_i
  @funds = options['funds'].to_i
end


def save()
  sql="INSERT INTO customers (name, age, funds) VALUES ($1, $2, $3) RETURNING id"
  values = [@name, @age, @funds]
  customer=SqlRunner.run(sql, values).first
  @id=customer['id'].to_i
end

def booked_films()
  sql= "select films.* from films inner join tickets on tickets.film_id=films.id AND customer_id=$1;"
  values = [@id]
  films=SqlRunner.run(sql, values)
  return films.map{ |film| Film.new (film)}
end



def delete()
  sql = "DELETE FROM customers WHERE id=$1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def remove_funds(funds)
  new_funds=@funds-funds
  @funds=new_funds
  sql="UPDATE customers SET funds = $1 WHERE id = $2"
  values=[new_funds, @id]
  SqlRunner.run(sql, values)
end


def update_name(new_name,id)
  sql="UPDATE customers SET name = $1 WHERE id = $2"
  values=[new_name, id]
  SqlRunner.run(sql, values)
end


def update()
  sql = "UPDATE customers SET name =$1, age=$2, funds=$3 WHERE id = $4"
  values = [@name, @age, @funds, @id]
  SqlRunner.run(sql, values)
end

def self.find_with_id(id)
sql= "SELECT * FROM customers WHERE id = $1"
values=[id]
return SqlRunner.run(sql, values)[0]
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
