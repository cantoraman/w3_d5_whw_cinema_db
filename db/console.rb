require('pry')
require_relative('../models/customer')
require_relative('../models/ticket')
require_relative('../models/film')


customer1 = Customer.new ({'name' => "Can", 'age' => "33"})
customer2 = Customer.new ({'name' => "John", 'age' => "400"})
customer1.save()
customer2.save()














binding.pry
nil
