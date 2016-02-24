class InterfaceController < ApplicationController

def index
    @actions = Action.all
    @categories = Category.all
    @benefits = Benefit.all
    @defects = Defect.all
    @symptoms = Symptom.all
end


def new
	@action = Action.new
	@category = Category.new
	@benefit = Benefit.new
	@defect = Defect.new
	@symptom = Symptom.new
end
  
def create
	  @action = Action.new(action_params)
	  @category = Category.new(category_params)
	  @benefit = Benefit.new(benefit_params)
	  @defect = Defect.new(defect_params)
	  @symptom = Symptom.new(symptom_params)
	
	  if @action.save
	    redirect_to @action
	  else
	    render 'new'
	  end
	  
	  if @category.save
	    redirect_to @category
	  else
	    render 'new'
	  end
	  
	  if @benefit.save
   redirect_to @benefit
  	else
   	render 'new'
		end
	  

    if @defect.save
    	
      render 'index'
    else
      render action: "new" 
    end
    
 	
		
	  if @symptom.save
    redirect_to @symptom
		else
    render 'new'
	end
  
end
	
private
	def action_params
		params.require(:action_object).permit(:name, :category_id, :benefit_ids=> [],
		:defect_ids => [])
	end
	
	def category_params
		params.require(:category).permit(:name)
	end
	
	def benefit_params
		params.require(:benefit).permit(:content)
	end
	
	def defect_params
		params.require(:defect).permit(:content)
	end
	
	def symptom_params
		params.require(:symptom).permit(:name, :action_ids => [])
	end
end
