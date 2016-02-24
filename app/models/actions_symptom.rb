class ActionsSymptom < ActiveRecord::Base
	belongs_to :action
	belongs_to :symptom
end
