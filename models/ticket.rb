require_relative("../db/sql_runner")

class Ticket

attr_reader :id
attr_accessor :customer_id, :film_id

def initialize (options)
  @id = options['id'].to_i if options['id']
  @customer_id = options['customer_id'].to_i
  @film_id = options['film_id'].to_i
end

def save()
sql="INSERT INTO tickets (customer_id, film_id) VALUES ($1,$2) RETURNING id"
values=[@customer_id, @film_id]
ticket=SqlRunner.run(sql, values).first
@id = ticket['id'].to_i
end


def self.update(customer_id, film_id)
  sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2)"
  values=[customer_id, film_id]
  SqlRunner.run(sql, values)
end

def self.all()
  sql = "SELECT * FROM tickets"
  tickets=SqlRunner.run(sql)
  return tickets.map{ |ticket| Ticket.new(ticket)}
end

def self.delete_all()
  sql = "DELETE FROM tickets"
  SqlRunner.run(sql)
end



end
