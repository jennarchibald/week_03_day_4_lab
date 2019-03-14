require('pry-byebug')
require_relative('./models/casting')
require_relative('./models/performer')
require_relative('./models/movie')

movie1 = Movie.new({'title' => 'Iron Man', 'genre' => 'superhero', 'budget' => '20000'})
movie1.save()
movie2 = Movie.new({'title' => 'Captain Marvel', 'genre' => 'superhero', 'budget' => '50000'})
movie2.save()

performer1 = Performer.new({'first_name' => 'Jeff', 'last_name' => 'Goldblum'})
performer1.save()
performer2 = Performer.new({'first_name' => 'Paris', 'last_name' => 'Hilton'})
performer2.save()

casting1 = Casting.new({'movie_id' => movie1.id, 'performer_id' => performer1.id, 'fee' => '10000'})
casting1.save()
casting2 = Casting.new({'movie_id' => movie1.id, 'performer_id' => performer2.id, 'fee' => '7000'})
casting2.save()

performer1.first_name = 'Geoff'
performer1.update()

movie2.title = 'Catwoman'
movie2.update()

casting2.movie_id = movie2.id
casting2.update()

binding.pry()
nil
