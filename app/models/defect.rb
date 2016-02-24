class Defect < ActiveRecord::Base
	has_many :actions_defects
	has_many :actions, through: :actions_defects
	
	def to_s
		content
	end
end
