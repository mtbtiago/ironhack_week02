# SL8. The smallest IMDB web application ever

# Remember IMDB gem? Oh, it feels like last year since we used it. Shall we do it again? YES!

# Re-using some knowledge we already have on it, we will implement a small Sinatra web app that performs the following:
# 1. GET '/top250' lists the Top 250 movies names. If a "limit" parameter is set, then we limit the list to first "limit" results.
# 2. GET '/rating' will get the rating for a specific movie or TV show. If "id" is passed, we will use this "id" directly to fetch
# the movie or show. If "name" is passed instead, we will search for that name and get the first result. Also, if the rating is lower than 5,
# we will go to a '/warning' page directly, advising of the dangers of watching that movie/show.
# 3. GET '/info' will get all the information for a specific movie or TV show: name, year of release, cast members... you name it.
# Again, we will use "id" or "name" params to fetch it.
# 4. GET '/results' will get a "term" parameter, and will return the number of results for a search using that term.
# 5. GET '/now' will print the current date and time. Because sometimes it's useful.
