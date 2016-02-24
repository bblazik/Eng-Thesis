class ActionsController < ApplicationController
	
	def index
    @actions = Action.all
  end

	def show
    		@action = Action.find(params[:id])
  end
  
	def update
  @action = Action.find(params[:id])
 
	  if @action.update(action_params)
	    redirect_to @action
	  else
	    render 'edit'
	  end
	end

	def edit
	  @action = Action.find(params[:id])
	end

	def new
  	@action = Action.new
	end
  
  def create
  @action = Action.new(action_params)
 	
 
  if @action.save
    redirect_to interface_index_path
  else
    render 'new'
  end
end

def destroy
	  @action = Action.find(params[:id]) 
	  @action.destroy
	 
	  redirect_to actions_path 
	end
  	
 
private
  	def action_params
    		params.require(:action_object).permit(:name, :category_id, :benefit_ids=> [],
    		:defect_ids => [])
  		
  	end
end


