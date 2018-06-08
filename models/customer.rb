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
