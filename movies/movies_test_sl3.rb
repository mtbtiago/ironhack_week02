#encoding: utf-8
require_relative 'movies_sl3.rb'

describe SL3 do
  before do
    @series = SL3.new
  end

  describe "#result_count" do
    it "Should return number of results for a given string" do
      result_count = @series.result_count("Cat")
      expect(result_count).to be >= (200)
    end
  end

  describe "#most_seasons_from" do
    it "Should return the serie with most seasons" do
      most_seasons_from = @series.most_seasons_from()
      # most_seasons_from = @series.most_seasons_from([
      # "Breaking Bad","Friends","Game of Thrones","The Office"])
      expect(most_seasons_from).to eq("Sons of Anarchy")
    end
  end

  describe "#most_episodes_from" do
    it "Should return the serie with most episodes" do
      most_episodes_from = @series.most_episodes_from()
      # most_episodes_from = @series.most_episodes_from([
      # "Breaking Bad","Friends","Game of Thrones","The Office"])
      expect(most_episodes_from).to eq("Sons of Anarchy")
    end
  end

  describe "#best_rated" do
    it "Should return the best rated serie" do
      # best_rated = @series.best_rated([
      # "Breaking Bad", "Pacific Blue", "The Affair"])
      best_rated = @series.best_rated()
      expect(best_rated).to eq("Breaking Bad")
    end
  end

  describe "#top_list" do
    it "Should return the n best rated series" do
      top_list = @series.top_list(3)
      expect(top_list).to eq(
      	["Sons of Anarchy", "Game of Thrones", "Breaking Bad"])
    end
  end

end
