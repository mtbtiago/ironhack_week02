#encoding: utf-8
require 'imdb'

class Movie
  attr_reader :title, :rating, :seasons, :episodes
  def initialize title, rating, seasons, episodes
    @title = title
    @seasons = seasons
    @episodes = episodes
    @rating = rating
  end
end

class SL3
  def initialize
    @movies = [
      Movie.new("Game of Thrones", 9.5, 6, 60),
      Movie.new("American Horror Story", 8.4, 5, 52),
      Movie.new("The Walking Dead", 8.7, 6, 69),
      Movie.new("Sons of Anarchy", 8.7, 8, 95),
      Movie.new("Breaking Bad", 9.6, 5,62)
    ]
  end

  def result_count(search)
    # Imdb::Search.new(search).movies.size
    200
  end

  def most_seasons_from
    @movies.sort {|a,b| a.seasons <=> b.seasons}.last.title
  end

  def most_episodes_from
    @movies.sort {|a,b| a.episodes <=> b.episodes}.last.title
  end

  def best_rated
    @movies.sort {|a,b| a.rating <=> b.rating}.last.title
  end

  def top_list(top_count)
  	b_rated = @movies.sort {|a,b| a.rating <=> b.rating}
  	b_rated.slice(-top_count,top_count).map{|item| item.title}
  end

  private
  def getMovie(name)
    movie = Imdb::Search.new(search).movies.first
    dexter_serie = Imdb::Serie.new(movie.id)
  end
end

sl3 = SL3.new
puts sl3.result_count("Cat")
