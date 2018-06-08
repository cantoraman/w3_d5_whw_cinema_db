require('pry')
require_relative('../models/customer')
require_relative('../models/ticket')
require_relative('../models/film')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()


customer1 = Customer.new ({'name' => "Can", 'age' => "33"})
customer2 = Customer.new ({'name' => "John", 'age' => "400"})
customer1.save()
customer2.save()

film1 = Film.new ({'title' => "Hulk vs Thor", 'starting_time' => "12:30", 'duration' => 135, 'age_req' =>12, 'price' =>3})
film2 = Film.new ({'title' => "Superman vs Batman", 'starting_time' => "14:40", 'duration' => 55, 'age_req' =>8,'price' =>5})
film3 = Film.new ({'title' => "Spider-man vs Mary Jane", 'starting_time' => "20:30", 'duration' => 135, 'age_req' =>18, 'price' =>23})
film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
ticket1.save()

def add_customer(name, age)
  Customer.update(name, age)
end

def add_film(title, starting_time, duration, age_req, price)
  Film.update(title, starting_time, duration, age_req, price)
end











binding.pry
nil
