require_relative 'shouter.rb'
require_relative 'big_one_class.rb'

describe User do
  before do
    @user = User.new
    @user.name = 'Manolo'
    @user.handle = '@manolito'
    @user.password = "12345678901234567890".reverse
  end

  it "should be valid with correct data" do
    expect(@user.valid?).to be_truthy
  end

  describe :name do
    it "should be invalid if name it's missing" do
      @user.name = nil
      expect(@user.valid?).to be_falsy
    end
  end

  describe :handle do
    it "should not contain spaces" do
      @user.handle = "manolito gafotas"
      expect(@user.valid?).to be_falsy
    end

    it "should not be not empty" do
      @user.handle = ""
      expect(@user.valid?).to be_falsy
    end

    it "should be in lower case" do
      @user.handle = "Manolito"
      expect(@user.valid?).to be_falsy
    end

    it "should start with @" do
      @user.handle = "manolito"
      expect(@user.valid?).to be_falsy
    end
  end

  describe :password do
    it "should be 20 chars length" do
      @user.password = "akdjdh"
      expect(@user.valid?).to be_falsy
    end
  end
end

# __END__

describe Shout do
  before do
    @user = User.new
    @user.name = 'Manolo'
    @user.handle = '@manolito'
    @user.password = "12345678901234567890".reverse

    @shout = Shout.new
    @shout.message = 'My first shout'
    @shout.user = @user
    @shout.likes = 0
  end

  it "should be valid with correct data" do
    expect(@shout.valid?).to be_truthy
  end

  describe :message do
    it "should be not empty" do
      @shout.message = ""
      expect(@shout.valid?).to be_falsy
    end
    it "should be not nil" do
      @shout.message = nil
      expect(@shout.valid?).to be_falsy
    end
    it "Should raise error msg" do
      @shout.message = ""
      expect(@shout.valid?).to be_falsy
      expect(@shout.errors.full_messages).to include("Message Don't be shy, say something")
    end
  end

  describe :user do
    it "should has an user" do
      @shout.user = nil
      expect(@shout.valid?).to be_falsy
    end
  end

  describe :likes do
    it "Should be a number" do
      @shout.likes = "a"
      expect(@shout.valid?).to be_falsy
    end
    it "Should be positive" do
      @shout.likes = -1
      expect(@shout.valid?).to be_falsy
    end
    it "Should be an integer" do
      @shout.likes = 1.1
      expect(@shout.valid?).to be_falsy
    end
  end
end

describe BigOne do
  before do
    @big_one = BigOne.new
  end

  context "When login" do
    it "should be a valid user" do
      user = @big_one.validate_and_return_user("@manolito","1")
      expect(user.name).to eq("Manolito Gafotas")
    end
    it "should be a INvalid user" do
      user = @big_one.validate_and_return_user("@manolito","a")
      expect(user).to be_nil
    end
  end
end
