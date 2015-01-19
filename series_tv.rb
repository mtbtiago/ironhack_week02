class Serie
  attr_reader :name, :year, :rating
  def initialize(name, year, rating)
    @name = name
    @year = year
    @rating = rating
  end
end

class SeriesMasterOfTheUniverse
  attr_reader :items
  def initialize
    @items = [
      [11124373,"Sons of Anarchy",2008,8.7],
      [944947,"Game of Thrones",2011,9.5],
      [1844624,"American Horror Story",2011,8.4],
      [1520211,"The Walking Dead",2010,8.8]
    ]
  end

  def top_one
    @items.max_by do
      |item| item[3]
    end
  end

  def series_of_year(the_year)
    # @items.select {|_,_,year,_| year == the_year}
    @items.select {|_,_,year,_| year == the_year}.map {|_,name,_,_,| name}
    # @items.reduce([]) do |result, id,name,year,rating|
    #   result << name if year == the_year
    # end
  end
end

## main
series = SeriesMasterOfTheUniverse.new
p series.top_one

describe SeriesMasterOfTheUniverse do
  before do
    @series = SeriesMasterOfTheUniverse.new
  end

  describe "#top_one" do
    it "Should Most rated TV serie" do
      top_one = @series.top_one
      expect(top_one).to eq(@series.items[1])
    end
  end

  describe "#series_of_year" do
    it "Should return series of specific year" do
      series_of_year = @series.series_of_year(2011)
      expect(series_of_year).to eq(["Game of Thrones","American Horror Story"])
    end
  end

end
