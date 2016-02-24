class BenefitController < ApplicationController
	def index
    @benefits = Benefit.all
  end

	def show
    @benefit = Benefit.find(params[:id])
  end

	def update
  @benefit = Benefit.find(params[:id])
 
  if @benefit.update(benefit_params)
    redirect_to @benefit
  else
    render 'edit'
  end
end

	def edit
	  @benefit = Benefit.find(params[:id])
	end

	def new
  	@benefit = Benefit.new
	end
  
  def create
  @benefit = Benefit.new(benefit_params)
 	
   if @benefit.save
   redirect_to interface_index_path
  else
   render 'new'
	end
end

def destroy
	  @benefit = Benefit.find(params[:id]) 
	  @benefit.destroy
	 
	  redirect_to benefit_index_path 
	end
  	
 
private
  	def benefit_params
    		params.require(:benefit).permit(:content)
  	end
end

