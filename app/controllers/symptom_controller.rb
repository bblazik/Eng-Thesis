class SymptomController < ApplicationController

def index
    @symptom = Symptom.all
  end

	def show
    		@symptom = Symptom.find(params[:id])
  end

	def update
  @symptom = Symptom.find(params[:id])
 
  if @symptom.update(symptom_params)
    redirect_to @symptom
  else
    render 'edit'
  end
end

	def edit
	  @symptom = Symptom.find(params[:id])
	end

	def new
  	@symptom = Symptom.new
	end
  
  def create
  @symptom = Symptom.new(symptom_params)
 	
 
  if @symptom.save
    redirect_to interface_index_path
  else
    render 'new'
    #redirect_to interface_index_path
  end
end

def destroy
	  @symptom = Symptom.find(params[:id]) 
	  @symptom.destroy
	 
	  redirect_to symptom_index_path 
	end
  	
 
private
  	def symptom_params
    		params.require(:symptom).permit(:name, :avatar, :action_ids => [])
  	end

end
