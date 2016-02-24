class DefectController < ApplicationController
	def index
    @defects = Defect.all
  end

	def show
    		@defect = Defect.find(params[:id])
  end

	def update
	  @defect = Defect.find(params[:id])
	 
	  if @defect.update(defect_params)
	    redirect_to @defect
	  else
	    render 'edit'
	  end
	end

	def edit
	  @defect = Defect.find(params[:id])
	end

	def new
  	@defect = Defect.new
	end
  
  def create
	  @defect = Defect.new(defect_params)
	 	
	 
	  if @defect.save
	    redirect_to interface_index_path
	  else
	    render 'new'
	  end
	end
  
  def destroy
	  @defect = Defect.find(params[:id]) 
	  @defect.destroy
	 
	  redirect_to defect_index_path 
	end
	

  	
 
private
  	def defect_params
    		params.require(:defect).permit(:content)
  	end
end

