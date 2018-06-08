class Film

attr_reader :id
attr_accessor :title, :starting_time, :duration, :age_req


def initialize (options)
  @id = options['id'].to_i if options['id']
  @title = options['title']
  @starting_time = Time.new(options['starting_time'])
  @duration = options['duration'].to_i
  @age_req = option['age_req'].to_i
end












end
