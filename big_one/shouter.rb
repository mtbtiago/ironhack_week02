require 'rubygems'
require 'active_record'
require 'securerandom'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'shouter.sqlite'
)

class User < ActiveRecord::Base

  PASSWORD_LENGTH = 20

  validates_presence_of :name, :handle, :password
  validates_format_of :handle, with: /\A@[a-z,0-9]+\z/
  validates :password,
    uniqueness: true,
    length: { is: PASSWORD_LENGTH }

  has_many :shouters

  # before_validation :check_for_blank_password

  private

  # def check_for_blank_password
  # 	password ||= SecureRandom.base64(20) 
  # end
end

class Shout < ActiveRecord::Base
  MESSAGE_LENGTH = 200

  validates :message, length: {
    minimum: 1,
    maximum: MESSAGE_LENGTH,
    too_long: "Sorry, message too long",
    too_short: "Don't be shy, say something"
  }
  validates :likes,
  numericality: {
    greater_than_or_equal_to: 0,
    only_integer: true
  }
  validates :user, presence: true
  belongs_to :user

end
