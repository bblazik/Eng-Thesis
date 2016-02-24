class Symptom < ActiveRecord::Base
	has_many :actions_symptoms
	has_many :actions, through: :actions_symptoms
	
	accepts_nested_attributes_for :actions
		
	def to_s
		name
	end
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "76x76#>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :avatar, attachment_presence: true
  validates :name, presence: true
end
