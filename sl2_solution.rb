
# SL2. I’m damn right about TV series!

# I love TV series. I hope you do too. One of the main topics about TV series is The Absolute Truth Answers, which everyone thinks
# he has but no one truly does.

# Is Lost Finale as shitty as everyone says? Is The Wire the best TV series ever, or is it Breaking Bad? WHY WAS FIREFLY CANCELLED?
# Is it true that whoever wrote Heroes season 3 was the Devil himself? Why is Community so underrated, being in fact the best comedy ever?

# Write a class, let’s say SeriesMasterOfTheUniverse, with several methods answering questions about the series universe. Try to add
# parameters to most questions: there is no point in testing constants! Then add the testing for it using RSpec. Write several tests
# for each question, exploring different scenarios.

# An example of a method is one that, when passing a list of some TV series, returns the best one. For instance, when prefering The Wire
# when comparing it to Friends, it should pass the tast. Otherwise, if it returns Mom as the best comedy aired on 2013, it should fail
# (I mean, Veep or Community were definitely better).

# Upgrade: use IMDB Ruby gem to remove arbitrarity!

class SeriesMasterOfTheUniverse
  RATINGS = {
    'Breaking Bad' => 9.9,
    'The Wire' => 10,
    'Community' => 9,
    'Dexter' => 8,
    'Firefly' => 8.5,
    'Lost' => 6
  }

  def best_ever
    sorted_shows(RATINGS.keys).last
  end

  def worst_ever
    sorted_shows(RATINGS.keys).first
  end

  def best_from(shows)
    sorted_shows(shows).last
  end

  private

  def sorted_shows(shows)
    shows.sort do |show_name|
      RATINGS[show_name]
    end
  end
end

describe SeriesMasterOfTheUniverse do
  before do
    @series_master = SeriesMasterOfTheUniverse.new
  end

  describe "#best_ever" do
    it "should return The Wire" do
      expect(@series_master.best_ever).to eq('The Wire')
    end
  end

  describe "#worst_ever" do
    it "should return Lost" do
      expect(@series_master.worst_ever).to eq('Lost')
    end
  end

  describe "#best_from" do
    it "should return The Wire when compared to Dexter and Lost" do
      expect(@series_master.best_from(["The Wire", "Dexter", "Lost"])).to eq('The Wire')
    end

    it "should return Community when compared to Firefly" do
      expect(@series_master.best_from(["Community", "Firefly"])).to eq('Community')
    end

    it "should return Dexter when compared to Lost" do
      expect(@series_master.best_from(["Dexter", "Lost"])).to eq('Dexter')
    end
  end
end
