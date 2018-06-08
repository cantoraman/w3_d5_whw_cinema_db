class Customer


def initialize (options)
  @id = options['id'].to_i if options['id']
  @name = options['name']
  @age = options['age'].to_i
end












end
