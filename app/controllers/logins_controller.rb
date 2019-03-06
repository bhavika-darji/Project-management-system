class LoginsController < ApplicationController
	def new
		@login = Login.new
	end
	def index
		@login = Login.new
	end

	def create
		@login = Login.new(params.require(:login).permit(:logintype, :username, :password))
		if @login.save
			flash[:success]="Registered Successfully"
			redirect_to new_login_path
		else
			flash[:warning]="Error has Occured!! try again"
			render new_login_path
		end
	end
	def destroy
	  	session[:checkuser_id] = nil
	  	redirect_to logins_path
	end
end
