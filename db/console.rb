require('pry')
require_relative('../models/customer')
require_relative('../models/ticket')
require_relative('../models/film')
require_relative('../models/screening')
require('tty-prompt')

Customer.delete_all()
Film.delete_all()
Ticket.delete_all()
Screening.delete_all()


def add_customer(name, age, funds)
  Customer.update(name, age, funds)
end

def add_screening(title, duration, age_req, price, starting_time, salon_number, salon_capacity)
  film=Film.new(title, duration, age_req, price)
  film.save()
  screening=Screening.new(film.id, starting_time, salon_number, salon_capacity)
  screening.save()
end


def add_ticket(customer_id, film_id, screening_id)
  Ticket.update(customer_id, film_id, screening_id)
end

def choose_customer()
  customers=Customer.all
  prompt = TTY::Prompt.new
  prompt_string = 'Please choose a customer'
  choices = customers.map {|customer| customer_name="#{customer.name} #{customer.id}"
  {customer_name => customer.id}}
  answer = prompt.select(prompt_string, choices)
  return Customer.new(Customer.find_with_id(answer))
end

#OLD FILM CHOOSER
# def choose_film()
#   films=Film.all
#   prompt = TTY::Prompt.new
#   prompt_string = 'Please choose a film'
#   choices = films.map {|film| film_name="#{film.title} #{film.starting_time}"
#   {film_name => film.id}}
#   answer = prompt.select(prompt_string, choices)
#   return Film.new(Film.find_with_id(answer))
# end



def choose_screening()
  screenings=Screening.all
  prompt = TTY::Prompt.new
  prompt_string = 'Please choose a screening'
  choices = screenings.map {|screening| film_name="#{screening.film_title} #{screening.starting_time}"
  {film_name => screening.id}}
  answer = prompt.select(prompt_string, choices)
  return Screening.new(Screening.find_with_id(answer))
end




def sell_ticket()
  customer = choose_customer()
  screening=choose_screening()
  film = Film.new(Film.find_with_id(screening.film_id))
  if (customer.funds>=film.price && customer.age>=film.age_req)
    customer.remove_funds(film.price)
    Ticket.update(customer.id, film.id)
  end

end

def show_all_tickets_by_customer()
  customer=choose_customer()
  customer.booked_films()
end
#Adding Customer - old way
# customer1 = Customer.new ({'name' => "Can", 'age' => "33", 'funds' => "2343"})
# customer2 = Customer.new ({'name' => "John", 'age' => "400", 'funds' => "100"})
# customer1.save()
# customer2.save()

#Adding Customer - new way
add_customer("Can", 33, 100)
add_customer("John", 50, 25)
add_customer("Paul", 12, 40)
add_customer("Ringo", 8, 10)
add_customer("Pete", 28, 2)


#Adding Films - old way
# film1 = Film.new ({'title' => "Hulk vs Thor", 'starting_time' => "12:30", 'duration' => 135, 'age_req' =>12, 'price' =>3})
# film2 = Film.new ({'title' => "Superman vs Batman", 'starting_time' => "14:40", 'duration' => 55, 'age_req' =>8,'price' =>5})
# film3 = Film.new ({'title' => "Spider-man vs Mary Jane", 'starting_time' => "20:30", 'duration' => 135, 'age_req' =>18, 'price' =>23})
# film1.save()
# film2.save()
# film3.save()


#Adding Film - new way
add_film("Spider-Man - 3D", "13:00", 120, 12, 10)
add_film("Spider-Man - 3D", "15:00", 120, 12, 10)
add_film("Spider-Man - 3D", "17:00", 120, 12, 10)
add_film("Spider-Man - 3D", "19:00", 120, 12, 10)
add_film("X-Men - 2D", "16:20", 135, 16, 5)
add_film("X-Men - 2D", "12:20", 135, 16, 5)
add_film("X-Men - 2D", "20:20", 135, 16, 5)
add_film("Deadpool", "20:30", 142, 18, 8)
add_film("Deadpool", "18:30", 142, 18, 8)
add_film("Deadpool", "16:30", 142, 18, 8)
add_film("Deadpool", "14:30", 142, 18, 8)
add_film("Spider-Man - 2D", "10:10", 120, 12, 5)
add_film("Spider-Man - 2D", "12:10", 120, 12, 5)
add_film("Spider-Man - 2D", "14:10", 120, 12, 5)
add_film("Spider-Man - 2D", "16:10", 120, 12, 5)



#Creating Tickets - old way
# ticket1 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film1.id})
# ticket1.save()
# ticket2 = Ticket.new({'customer_id' => customer1.id, 'film_id' => film2.id})
# ticket2.save()
# ticket3 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film1.id})
# ticket3.save()
# ticket4 = Ticket.new({'customer_id' => customer2.id, 'film_id' => film3.id})
# ticket4.save()
#






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


#count tickets



# Create a screenings table that lets us know what time films are showing (HARD, needs serious restructuring of your sql schema, tables, and classes)
# Write a method that finds out what is the most popular time (most tickets sold) for a given film
# Limit the available tickets for screenings.
# Add any other extensions you think would be great to have at a cinema!
