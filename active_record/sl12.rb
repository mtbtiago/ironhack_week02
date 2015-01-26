# SL11. Valid students are valid students

# You loved the exampled about students, huh? Let’s student you up then!

# We just have a really nice student class, but we are worried that our dog adds some typo into it, so we wanna be sure that we can
# check it’s working as we want it to, automagically.

# How could we do that? Let me think…

# OH, YEAH! TESTING!

# So we are going to do some nice testing and implementation on this Student class with the following:
# 1. First, add tests for each one of the validations we have. Check that if we don’t have a name for a
# student then the student is not valid,
# same for surnames; also check that if we have an 11 year old student we won’t accept him (yet), and so on.

# 2. Add a “complete_name” method, but with the help of TDD. Remember: add the tests about the behaviour, then the tests will fail,
# and finally just implement the method and all tests will pass again.

# 3. Once all the specs pass add some more validations of your own. For example, we won’t accept students born before 1970 that
# have more than one dog, and we also won’t accept students which have “Xavier” name, because we want him to be the only Xavier
# in Ironhack <3 (repeat the same with “Nick”, because we love him starting at us doing yoga)

# 4. Finally, remove all the ActiveRecord validations and implement them on your own with the “validate” DSL method.
#  Let’s go, folks!

# Note: you will find a student.rb template file and the student.sqlite database in Slack.
require 'rubygems'
require 'active_record'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'students.sqlite'
)
I18n.enforce_available_locales = false # get rid of the warning

class Student < ActiveRecord::Base
  # we have name, surnames, birthday, website, number_of_dogs
  # and first_programming_experience

  AGE_MINIMUM = 11

  validates_presence_of :name, :surnames
  validates_format_of :website, with: /http:/
  validates_numericality_of :number_of_dogs, greater_than: 0
  validate :proper_age
  validate :black_list_names

  def complete_name
    name+" "+surnames
  end

  private

  def proper_age
    unless birthday < AGE_MINIMUM.years.ago
      errors.add(:birthday, 'is too young')
    end
  end

  def black_list_names
    if ["Xavier","Nick"].include? name
      errors.add(:name, "We just accept one Nick and one Xavier")
    end
  end
end

describe Student do

  before do
    @student = Student.new
    @student.name = 'Joe'
    @student.surnames = 'Ironhack'
    @student.birthday = Date.new(1987,12,5)
    @student.number_of_dogs = 1
    @student.website = 'http://ironhack.com'
  end

  it "should be valid with correct data" do
    expect(@student.valid?).to be_truthy
  end

  describe :name do
    it "should be invalid if name it's missing" do
      @student.name = nil
      expect(@student.valid?).to be_falsy
    end
  end

  describe :surnames do
    it "should be invalid if surnames it's missing" do
      @student.surnames = nil
      expect(@student.valid?).to be_falsy
    end
  end

  describe :birthday do
    it "should be older than 11" do
      @student.birthday = 8.years.ago
      expect(@student.valid?).to be_falsy
    end
  end

  describe "complete_name" do
    it "sholud return comple name" do
      complete_name = @student.complete_name
      expect(complete_name).to eq("Joe Ironhack")
    end
  end
end
