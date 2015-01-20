require_relative 'oc1.rb'

describe Lexicomitron do
	before do
		@lexicom = Lexicomitron.new
	end

	describe "#shazam" do
	  it "Should reverse words and return first and last" do
	  	result = @lexicom.shazam(["This", "is", "a", "boring","test"])
	  	expect(result).to match_array(["sih", "se"])
	  end
	end

	describe "#oompa_loompa" do
	  it "Should return words 3 or less chars length" do
	  	result = @lexicom.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])
	  	expect(result).to match_array(["if", "you","be", "my"])
	  end
	end

	describe "#all_in_line" do
	  it "Should sort input array of words from longer to shorter, and then print them all in a string, using the X string as the delimiter." do
	  	result = @lexicom.all_in_line(["words", "are", "tremendously", "nice"],"$")
	  	expect(result).to eq("remendously$words$nice$are")
	  end
	end

	describe "#supercounter" do
	  it "Should return the number of letters, within all those words, that appear before 't' in the alphabet." do
	  	result = @lexicom.supercounter(["I", "am", "getting", "tired", "of", "your", "words"])
	  	expect(result).to eq(20)
	  end
	end
end