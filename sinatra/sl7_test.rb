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

    it "Should show parts and cost" do
      result = @bike.to_s
      expect(result).to eq("Your bike cost ...")
    end
  end
end
