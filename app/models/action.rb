class Action < ActiveRecord::Base
	has_many :actions_symptoms
	has_many :symptoms, through: :actions_symptoms 
	
	has_many :actions_defects
	has_many :defects, through: :actions_defects
	
	has_many :actions_benefits
	has_many :benefits, through: :actions_benefits 
	
	belongs_to :category
	
	accepts_nested_attributes_for :benefits
	accepts_nested_attributes_for :defects
	
	def to_s
		name
	end
end
