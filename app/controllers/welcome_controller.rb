class WelcomeController < ApplicationController
  def index
  	@actions = Action.all
  	@category = Category.all
  	@benefit = Benefit.all
  	
  end
  
  def show
		#@category = Category.find(params[:id])
		@actions = Action.find(params[:data_name])
		@category = Category.find(params[:data_name])
	end
	
	def show_benefit(param)
		@actions = Action.find_by name: param
	end
	
	#def
	#	@
	#end
end
