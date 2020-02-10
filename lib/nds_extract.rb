# Provided, don't edit
require 'directors_database'

# A method we're giving you. This "flattens"  Arrays of Arrays so: [[1,2],
# [3,4,5], [6]] => [1,2,3,4,5,6].

def flatten_a_o_a(aoa)
  result = []
  i = 0

  while i < aoa.length do
    k = 0
    while k < aoa[i].length do
      result << aoa[i][k]
      k += 1
    end
    i += 1
  end

  result
end

def movie_with_director_name(director_name, movie_data)
  { 
    :title => movie_data[:title],
    :worldwide_gross => movie_data[:worldwide_gross],
    :release_year => movie_data[:release_year],
    :studio => movie_data[:studio],
    :director_name => director_name
  }
end


# Your code after this point

def movies_with_director_key(name, movies_collection)
  collection = []
  movies_index = 0 
  while movies_index < movies_collection.length do 
    collection << movie_with_director_name(name, movies_collection[movies_index])
    movies_index += 1 
  end
  
  collection 
 
end


def gross_per_studio(collection)
  movie_gross = {}
  movie_index = 0 
  while movie_index < collection.length do 
    puts collection[movie_index]
    studio = collection[movie_index][:studio]
    worldwide_gross = collection[movie_index][:worldwide_gross]
    old_gross = movie_gross[studio] || 0 
    
    
    puts "studio : #{studio} ****** old gross : #{old_gross} world_gross : #{worldwide_gross}"
    
    new_gross = old_gross += worldwide_gross
    movie_gross[studio] = new_gross
    movie_index += 1 
    
    
    
  end 
  movie_gross
  # GOAL: Given an Array of Hashes where each Hash represents a movie,
  # return a Hash that includes the total worldwide_gross of all the movies from
  # each studio.
  #
  # INPUT:
  # * collection: Array of Hashes where each Hash where each Hash represents a movie
  #
  # RETURN:
  #
  # Hash whose keys are the studio names and whose values are the sum
  # total of all the worldwide_gross numbers for every movie in the input Hash

end








def movies_with_directors_set(source)
  
  director_movies = []
  director_index = 0 
  while director_index < source.length do 
    name = source[director_index][:name]
    movies = source[director_index][:movies]
    movie_index = 0 
    while movie_index < movies.length do 
      puts "movie index : #{movies[movie_index]} #*#*#*#*#*##*"
      movies[movie_index][:director_name] = name 
      director_movies << [movies[movie_index]]
      movie_index +=1 
    
    end
    director_index +=1 
    
   
  end
  director_movies
  # GOAL: For each director, find their :movies Array and stick it in a new Array
  #
  # INPUT:
  # * source: An Array of Hashes containing director information including
  # :name and :movies
  #
  # RETURN:
  #
  # Array of Arrays containing all of a director's movies. Each movie will need
  # to have a :director_name key added to it.
  
 
end

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  puts "movies_with_director_names: #{movies_with_director_names} * ** * * *  *"
  return gross_per_studio(movies_with_director_names)
  
end
