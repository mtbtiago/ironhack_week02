# SL8. The smallest IMDB web application ever

# Remember IMDB gem? Oh, it feels like last year since we used it. Shall we do it again? YES!

# Re-using some knowledge we already have on it, we will implement a small Sinatra web app that performs the following:
# 1. GET '/top250' lists the Top 250 movies titles. If a "limit" parameter is set, then we limit the list to first "limit" results.
# 2. GET '/rating' will get the rating for a specific movie or TV show. If "id" is passed, we will use this "id" directly to fetch
# the movie or show. If "title" is passed instead, we will search for that title and get the first result. Also, if the rating is lower than 5,
# we will go to a '/warning' page directly, advising of the dangers of watching that movie/show.
# 3. GET '/info' will get all the information for a specific movie or TV show: title, year of release, cast members... you title it.
# Again, we will use "id" or "title" params to fetch it.
# 4. GET '/results' will get a "term" parameter, and will return the number of results for a search using that term.
# 5. GET '/now' will print the current date and time. Because sometimes it's useful.

require 'imdb'
require 'pstore'
require 'ap'

class Movie < Struct.new(:id,:title,:rating,:year)
end

class SL8
  # attr_reader :movies
  def initialize
    @movies = PStore.new("movies_250.pstore")
    @movies_imdb = {}
    # load_movies_coded
    # load_movies_pstore
    load_movies_imdb
    save_movies_pstore

    # @movies_imdb.each do |k|
    #   puts k
    # end
  end

  private

  def load_movies_imdb
  	i = 0
    Imdb::Top250.new.movies.each do |movie|
      movie = Movie.new(movie.id,movie.title,movie.rating,movie.year)
      puts i
      ap movie
      @movies_imdb[movie.id] = movie
      i += 1
    end
  end

  def save_movies_pstore
    @movies.transaction do
      @movies_imdb.keys.each do |key|
        @movies[key.to_sym] = @movies_imdb[key]
        puts @movies_imdb[key]
      end
      @movies.commit
    end
  end

  def load_movies_pstore
    @movies.transaction do
      @movies.roots.each do |item|
        @movies_imdb[item] = @movies[item]
      end
      @movies.commit
    end
  end

  def load_movies_coded
    # Imdb::Top250.new.movies.each do |movie|
    #   @movies_imdb[movie.id] = Movie.new(movie.id,movie.title,movie.rating,movie.year)
    # end
    @movies_imdb["1"] = Movie.new("1","movie.title1","movie.rating1","movie.year1")
    @movies_imdb["2"] = Movie.new("2","movie.title2","movie.rating2","movie.year2")
    @movies_imdb["3"] = Movie.new("3","movie.title3","movie.rating3","movie.year3")
  end
end

### main
sl8 = SL8.new
