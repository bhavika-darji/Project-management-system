class Login < ApplicationRecord
	def self.ProvideType(t)
		Login.find(t).logintype
	end
end
