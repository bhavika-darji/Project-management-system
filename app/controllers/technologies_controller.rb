class TechnologiesController < ApplicationController
	def index
	 	if session[:checkuser_id]
	        @technology = Technology.all
	  else 
	        flash[:success]="please Login First"
	        redirect_to logins_path
	  end
	end
	def new
		@technology = Technology.new
	end
	def edit
		@technology = Technology.find(params[:id])
	end
	def create
		@technology = Technology.new(technology_params)
	 	if @technology.save
			redirect_to technologies_path
		else
			render 'new'
		end
	end
	def update
		@technology = Technology.find(params[:id])
		if @technology.update(technology_params)
			redirect_to technologies_path
		else
			render 'edit'
		end
	end
	def destroy
  		@technology = Technology.find(params[:id])
  		@technology.destroy
			redirect_to technologies_path
	end
	private
		def technology_params
			params.require(:technology).permit(:name)
		end
end
