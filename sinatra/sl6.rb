# SL6. Spotinatra

# In the times of Frank Sinatra, there was no Spotify. People had to see him live, or listen to him through a timetable.
# Can you imagine to live in a time like that? At least there was no Justin Beiber! :)

# Anyway, we woke up today with the strong will of telling Frank Sinatra how music is these days. It would be weird to go
# to his grave and tell him, so we will implement a little web application with Sinatra.

# This web application will have three different routes. The first one will be in the home (‘/‘), will be GET, and will
# list the songs that we have sent to our web application. In the beginning, it will be empty, so nothing will be printed out.

# The second one will be ‘/songs/new’, will be POST, and will have both “name” and “artist” parameters. This will add a
# new song to our internal list of songs, and redirect to home (the first route).

# Finally, when we have sent 10 songs to the system through the second route, instead of being redirected to home, we
# will be redirected to a third route, called ‘/enough’, that shows a warning message, crafted by Sinatra himself,
# staging that current music, and I quote, “IS WORTH F***ING NOTHING”*.

# * I am not responsible from Sinatra words. I mean, he said it in his way.

require 'sinatra'
require 'sinatra/reloader'

class SinatraRidesAgain
  attr_reader :songs
  def initialize
    @songs = {}
  end

  def to_s
    return "We haven't songs yet" if songs.size == 0
    songs.keys.reduce(""){|result,key|
      result += "Song: #{key}. Artist: #{@songs[key]}\n"
    }
  end

  def add_song(name,artist)
    @songs[name] = artist
    @songs.size
  end
end

set :port, 3001
set :bind, '0.0.0.0'

### main

sinat = SinatraRidesAgain.new

get '/' do
  sinat.to_s
end

post '/songs/new' do
  if sinat.add_song(params[:name], params[:artist]) >= 10
    redirect('/enought')
  else
    redirect('/')
  end
  true
end

get '/enought' do
  "IS WORTH F***ING NOTHING"
end
