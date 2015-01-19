#encoding: utf-8
require_relative 'd103_tvshows.rb'


describe SL3 do
  before do
    @series = SL3.new
  end

  describe "#result_count" do
    it "Should return number of results for a given string" do
      result_count = @series.result_count("Cat")
      expect(result_count).to be > (200)
    end
  end

  describe "#most_seasons_from" do
    it "Should return the serie with most seasons" do
      most_seasons_from = @series.most_seasons_from([
      "Breaking Bad","Friends","Game of Thrones","The Office"])
      expect(most_seasons_from).to eq("Friends")
    end
  end

  describe "#most_episodes_from" do
    it "Should return the serie with most episodes" do
      most_episodes_from = @series.most_episodes_from([
      "Breaking Bad","Friends","Game of Thrones","The Office"])
      expect(most_episodes_from).to eq("Friends")
    end
  end

  describe "#best_rated" do
    it "Should return the best rated serie" do
      best_rated = @series.best_rated([
      "Breaking Bad", "Pacific Blue", "The Affair"])
      expect(best_rated).to eq("Breaking Bad")
    end
  end

  describe "#top_rated" do
    it "Should return the n best rated series" do
      top_rated = @series.top_rated(3)
      expect(top_rated).to eq(
      	["Breaking Bad", "Pacific Blue", "The Affair"])
    end
  end

end
