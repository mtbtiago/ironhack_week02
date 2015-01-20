require_relative 'oc2.rb'

describe TheBanker do

  context "when not euro involved" do
    it "Should convert usd to gbp" do
      result = TheBanker.convert(123,"usd","gbp")
      expect(result).to eq(75.12)
    end
    it "Should convert usd to usd" do
      result = TheBanker.convert(123,"usd","usd")
      expect(result).to eq(123)
    end
  end

  context "when euro to foreign" do
    it "Should convert eur to usd" do
      result = TheBanker.convert(123,"eur","usd")
      expect(result).to eq(157.88)
    end
  end

  context "when euro to euro" do
    it "Should convert eur to eur" do
      result = TheBanker.convert(123,"eur","eur")
      expect(result).to eq(123)
    end
  end

  context "when foreign to eur" do
    it "Should convert aud to eur" do
      result = TheBanker.convert(123,"aud","eur")
      expect(result).to eq(84.93)
    end
  end
end
