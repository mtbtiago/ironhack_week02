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

require_relative 'sl8_class'
require 'sinatra'

### main
set :port, 3001
set :bind, '0.0.0.0'

sl8 = SL8.new

get '/top' do
  @movies = sl8.movies.values
  @limit = params[:limit] ||= 250
  erb :sl8_top
end

get '/rating' do
  if params[:id]
    movie = sl8.movie_by_id(params[:id])
  elsif params[:name]
    movie = sl8.movie_by_title(params[:name])
  else
    movie = sl8.null_movie
  end
  if movie.is_null
    erb :sl8_not_found
  elsif movie.rating < 5
    redirect("/warning?title=#{movie.title}")
  else
    # redirect("/results&search=#{movie.title}")
    redirect("/info?id=#{movie.id.to_s}")
  end
end

# get '/rating' do
#   movie = sl8.movie_by_id(params[:id])
#   if movie.rating < 5
#     # redirect("/warning&title=#{movie.title}")
#     redirect("/warning?title="+"#{movie.title}")
#   else
#     # redirect('/now')
#     redirect("/results?search=#{movie.title}")
#   end
# end

get '/warning' do
  @title = params[:title]
  erb :sl8_warning
end

get '/info' do
  @movie = sl8.movie_by_id(params[:id].to_s)
  erb :sl8_info
end

get '/results' do
  @search = params[:search]
  @movies = sl8.movie_search(@search)
  erb :sl8_results
end

get '/now' do
  @date_str = Date.today.strftime('%A, %-d/%m/%Y')
  erb :sl8_now
end

__END__

no plus ultra