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
ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
ticket2.save()
ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
ticket3.save()
ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
ticket4.save()




def add_film(title, starting_time, duration, age_req, price)
  Film.update(title, starting_time, duration, age_req, price)
end

def add_ticket(customer_id, film_id)
  Ticket.update(customer_id, film_id)
end








binding.pry
nil





#
# CodeClan Cinema (CCC (again))
# Create a system that handles bookings for our newly built cinema! It's enough if you can call your methods in pry, don't worry about an interface.
#
# Your app should have:
# Customers
#
# name
# funds
# Films
#
# title
# price
# Tickets
#
# customer_id
# film_id
# Your app should be able to:
# Create customers, films and tickets
# CRUD actions (create, read, update, delete) customers, films and tickets.
########### DELETE SINGLES




# Basic extensions:
# Buying tickets should decrease the funds of the customer by the price
# Check how many tickets were bought by a customer
# Check how many customers are going to watch a certain film
# Advanced extensions:
# Create a screenings table that lets us know what time films are showing (HARD, needs serious restructuring of your sql schema, tables, and classes)
# Write a method that finds out what is the most popular time (most tickets sold) for a given film
# Limit the available tickets for screenings.
# Add any other extensions you think would be great to have at a cinema!
