require_relative 'sl8_class.rb'

describe SL8 do
  before do
    @sl8 = SL8.new
  end

  context "When main" do
    # before do
    #   @sl8.add_part("frame",1500)
    #   @sl8.add_part("fork",900)
    # end

    it "Should return null object" do
      result = @sl8.movie_by_id("99999")
      expect(result.is_null).to eq(true)
    end

    it "Should return valid movie by id" do
      result = @sl8.movie_by_id("0101414")
      expect(result.id).to eq("0101414".to_sym)
    end

    it "Should return valid movie by name" do
      result = @sl8.movie_by_title("la bella y la bestia")
      expect(result.title).to eq("La bella y la bestia")
    end
  end

  context "When searching" do
    it "Should return movies by similar name" do
      result = @sl8.movie_search("muerte")
      ids = result.map{|movie| movie.id.to_s}
      expect(ids).to eq(["0053125", "0059578", "1201607"])
    end
    it "Should return movies on this year" do
      result = @sl8.movie_search("1941")
      ids = result.map{|movie| movie.id.to_s}
      expect(ids).to eq(["0033467", "0033870"])
    end
    it "Should return movies by this rating" do
      result = @sl8.movie_search("9.3")
      ids = result.map{|movie| movie.id.to_s}
      expect(ids).to eq(["0111161"])
    end
  end
end
