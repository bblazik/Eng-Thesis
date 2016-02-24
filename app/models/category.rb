class Category < ActiveRecord::Base
	has_many :actions

	
	def to_s
		name
	end
end
