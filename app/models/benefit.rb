class Benefit < ActiveRecord::Base
	has_many :actions_benefits
	has_many :actions, through: :actions_benefits
	
	
	def to_s
		content
	end
end
