# SL7. They call it free will

# OK, so we got ourselves comfortable with Sinatra, and the way he plays the songs we write.
# That’s nice, our first web applications! Remember this moment :)

# Now I want you to think on a small web application with no UX at all and just a bit of interaction
# with a web client. You can do iterations on it so you add one feature at a time.

# Take a moment to read a bit of Sinatra documentation (test yourself!) and play with this tiny web
# framework. Use several routes, redirects, parameters and conditions.

# Go ahead! :D

require 'sinatra'
require 'sinatra/reloader'

class YourBike
  def initialize
    @parts = {}
  end

  def to_s
    return "No mounted bike yet" if @parts.size == 0
    total = 0
    @parts.keys.reduce("<!DOCTYPE html><html><head><meta charset=\"utf-8\"><title>Ironhack Prework landing page</title>
</head><body style=\"font-family: courier\"><header><h1>Let's mount your bike</h1></header><ol>"){|result,key|
      price = @parts[key].to_f
      total += price
      result += "<li>"+formatDescCurr(key,price)+"</li>"
    }+"</ol>"+formatDescCurr("<strong>Total",total)+"</strong></footer></body></html>"
  end

  def add_part(part,price)
    @parts[part] = price
  end

  private

  def formatCurr(value)
    return "$#{"%#10.2f" % value.round(2)}"
  end

  def formatDescCurr(desc, curr)
    return "#{"%-20s" % desc}: #{formatCurr(curr)}"
  end

end

set :port, 3001
set :bind, '0.0.0.0'

### main

bike = YourBike.new

get '/' do
  bike.to_s
end

post '/parts/add' do
  bike.add_part(params[:part], params[:price])
  redirect('/')
end
