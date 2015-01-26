require_relative 'shouter.rb'

class BigOne
	attr_accessor :user
	def initialize

	end

	def validate_and_return_user(user, passw)
		result = User.find_by_handle(user)
		return nil unless result
		return nil if result.password != passw
		result
	end
end