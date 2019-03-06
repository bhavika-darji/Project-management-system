class ProjectsController < ApplicationController
def index
	 	if session[:checkuser_id]
	        if params[:qry]
	        	@project = Project.where(pm: params[:qry])
	        else
	        	@project = Project.all
	        end
	  else 
	        flash[:success]="please Login First"
	        redirect_to logins_path
	  end
	end
	def new
		@project = Project.new
	end
	def edit
		@project = Project.find(params[:id])
	end
	def create
		@project = Project.new(project_params)
	 	if @project.save
			redirect_to projects_path
		else
			render 'new'
		end
	end
	def update
		@project = Project.find(params[:id])
		if @project.update(project_params)
			redirect_to projects_path
		else
			render 'edit'
		end
	end
	def destroy
  		@project = Project.find(params[:id])
  		@project.destroy
			redirect_to projects_path
	end
	private
		def project_params
			param = params.require(:project).permit(:name,:start_date,:end_date,:pm,:budget,:client_id,:technology_id,employee:[])
			# param[:client_id] = Client.find(param[:client_id])
			# param[:technology_id] = Technology.find(param[:technology_id])
			# param
		end
end
