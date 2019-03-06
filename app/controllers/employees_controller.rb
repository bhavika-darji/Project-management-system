class EmployeesController < ApplicationController
def index
	 	if session[:checkuser_id]
	        @employee = Employee.all
	  else 
	        flash[:success]="please Login First"
	        redirect_to logins_path
	  end
	end
	def new
		@employee = Employee.new
	end
	def edit
		@employee = Employee.find(params[:id])
	end
	def create
		@employee = Employee.new(employee_params)
	 	if @employee.save
			redirect_to employees_path
		else
			render 'new'
		end
	end
	def update
		@employee = Employee.find(params[:id])
		if @employee.update(employee_params)
			redirect_to employees_path
		else
			render 'edit'
		end
	end
	def destroy
  		@employee = Employee.find(params[:id])
  		@employee.destroy
			redirect_to employees_path
	end
	private
		def employee_params
			param = params.require(:employee).permit(:name,:email,:role,:experience,:status,:technology_id)
		end
end
