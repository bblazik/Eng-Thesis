class ActionsBenefit < ActiveRecord::Base
	belongs_to :action
	belongs_to :benefit
end
