class ActionsDefect < ActiveRecord::Base
	belongs_to :action
	belongs_to :defect
end
