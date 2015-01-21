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

class Formatter
  def self.formatCurr(value)
    return "$#{"%#10.2f" % value.round(2)}"
  end

  def self.formatDescCurr(desc, curr)
    return "#{"%-20s" % desc}: #{formatCurr(curr)}"
  end

end

class Part
  attr_reader :name, :price
  def initialize(name,price)
    @name = name
    @price = price
  end

  def to_s
    Formatter.formatDescCurr(@name,@price)
  end
end

class YourBike
  def initialize
    @parts = {}
  end

  def get_total
    # return "No mounted bike yet" if @parts.size == 0
    @parts.keys.reduce(0) {|total,key|
      total += @parts[key].price
    }
  end

  def add_part(part,price)
    @parts[part] = Part.new(part,price.to_f)
  end

  def get_part(name)
    @parts[name]
  end

  def get_parts
  	@parts.values
  end
end

set :port, 3001
set :bind, '0.0.0.0'

### main

bike = YourBike.new

get '/' do
  # @list = bike.to_s
  @total_str = Formatter.formatDescCurr("Total",bike.get_total)
  @parts = bike.get_parts
  erb :sl7
end

post '/parts/add' do
  bike.add_part(params[:part], params[:price])
  redirect('/')
end
