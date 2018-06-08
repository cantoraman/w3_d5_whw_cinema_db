require_relative("../db/sql_runner")

class Customer

  attr_reader :id
  attr_accessor :name, :age


def initialize (options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @age = options['age'].to_i
end












end
