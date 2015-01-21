require_relative 'sl7.rb'

describe YourBike do
  before do
    @bike = YourBike.new
  end

  context "When main" do
    before do
      @bike.add_part("frame",1500)
      @bike.add_part("fork",900)
    end

    it "Should return total" do
      result = @bike.get_total
      expect(result).to eq(2400.0)
    end

    it "Should return a formatted part" do
      result = @bike.get_part("fork").to_s
      expect(result).to eq("fork                : $    900.00")
    end

    it "Should return a part" do
      result = @bike.get_parts[1].to_s
      expect(result).to eq("fork                : $    900.00")
    end
  end
end
