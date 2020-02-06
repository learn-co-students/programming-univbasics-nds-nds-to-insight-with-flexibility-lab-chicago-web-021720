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
#pp movie_data
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

  array = []
  for i in movies_collection
    array.push movie_with_director_name(name, i)
  end
  #pp array
  return array

  
  # GOAL: For each Hash in an Array (movies_collection), provide a collection
  # of movies and a directors name to the movie_with_director_name method
  # and accumulate the returned Array of movies into a new Array that's
  # returned by this method.
  #
  # INPUT:
  # * name: A director's name
  # * movies_collection: An Array of Hashes where each Hash represents a movie
  #
  # RETURN:
  #
  # Array of Hashes where each Hash represents a movie; however, they should all have a
  # :director_name key. This addition can be done by using the provided
  # movie_with_director_name method
end


def gross_per_studio(collection)

studio_gross=Hash.new
for i in collection
  info=i
  studio=info[:studio]
  studio_gross[studio]=0
end
#pp studio_gross


for i in collection
  info=i 
  studio=info[:studio]
  gross=info[:worldwide_gross]
  #pp studio_gross[studio]
  studio_gross[studio]+=gross
end
pp studio_gross  

#  studio_gross[studio]+=gross
  #initially I was trying to use 'studio_gross[studio]=gross+=gross' above but this threw an error. I changed it to 0 as placeholder values.

#pp studio_gross
#return studio_gross


#for i in studio_gross
#  gross_list.push(0)
#end
#pp gross_list
#above I was trying to make an array of ints coinciding with the array of hashes constructed above. I was then going to make another iteration after this looping through 'collection' and adding gross values to the corresponding indexes. I have a fuzzy idea on how to do this but haven't tried it yet.


#collection.each do |key, value|
#  if key==

#total=0
#  answer = {}
#  for i in collection
#  total+=i[:worldwide_gross]
#  answer[i[:studio]]=0
#  answer[i[:studio]]+=total
#end
#return answer

#this was my earlier attempt, but it didn't work. Might be a good idea to come back to it so I'm saving it here.

#  total=0
#  studios=[]
#  answer = {}
#  for i in collection
#  answer[i[:studio]]='test'
#    answer.each do |key, value|
#      studios.push "key"
#    end
#  end
#end
#pp answer
#studios
#return answer
#I no longer remember what the above was, a fragment from a previous attempt to answer.  
  

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
  # GOAL: For each director, find their :movies Array and stick it in a new Array

array = []
for i in source
#pp i
  info=i
  name=info[:name]
  movies=info[:movies]
  array.push(movies_with_director_key(name, movies))
end
return array
end
  

# ----------------    End of Your Code Region --------------------
# Don't edit the following code! Make the methods above work with this method
# call code. You'll have to "see-saw" to get this to work!

def studios_totals(nds)
  a_o_a_movies_with_director_names = movies_with_directors_set(nds)
  movies_with_director_names = flatten_a_o_a(a_o_a_movies_with_director_names)
  return gross_per_studio(movies_with_director_names)
end
