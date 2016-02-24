class ProblemController < ApplicationController

	def index
  	@actions = Action.all
  	@category = Category.all
  	@benefit = Benefit.all
  	@symptom = Symptom.all
  end
  
end
