require 'pstore'
require 'ap'

class Movie < Struct.new(:id,:title,:rating,:year)
  attr_accessor :is_null

  def to_s
    "IMDB ID: #{id}. #{title}. Rating: #{rating}. Year: #{year}"
  end

  def match?(search_text)
    (title.index(search_text)) ||
      (year.to_s == search_text) ||
      (rating.to_s == search_text)
  end

end

class SL8
  attr_reader :movies

  def initialize
    @movies_pstore = PStore.new("movies_250.pstore")
    @movies = {}
    load_movies_pstore

    # @movies.values.each do |movie|
    #   ap movie.to_s
    # end
  end

  def null_movie
    Movie.new(0,"Not found",0,0).tap do |movie|
      movie.is_null = true
    end
  end

  def movie_by_id(id)
    @movies[id.to_sym] ||= null_movie
  end

  def movie_by_title(title)
    result = @movies.values.select {|movie| movie.title.casecmp(title) == 0 }
    if result.size > 0
      result[0]
    else
      null_movie
    end
  end

  def movie_search(search)
    @movies.values.select {|movie| movie.match?(search)}
  end

  private

  def load_movies_pstore
    @movies_pstore.transaction do
      @movies_pstore.roots.each do |item|
        @movies[item] = Movie.new(
          item,
          @movies_pstore[item][1].gsub(/\d{1,3}\.\n\s+/,""),
          @movies_pstore[item][2],
        @movies_pstore[item][3])
      end
      @movies_pstore.commit
    end
  end
end
