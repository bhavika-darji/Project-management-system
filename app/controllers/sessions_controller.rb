class SessionsController < ApplicationController
	def create
		@login = Login.new(params.require(:login).permit(:logintype, :username, :password))
		 	if Login.exists?(:username => @login.username)
        @checkuser = Login.where("username=?", @login.username)
        if @checkuser[0].password == @login.password && @checkuser[0].logintype == @login.logintype
        		session[:checkuser_id] = @checkuser[0].id
            flash[:success]="Successfully logged in!!!!!"
            redirect_to projects_path(@checkuser[0])
        else
            flash[:warning]="Enter correct Details"
            redirect_to logins_path
        end
		  else 
		        flash[:warning]="Enter correct username"
		        redirect_to logins_path
		  end
	end
	def destroy
	  	session[:checkuser_id] = nil
	  	redirect_to logins_path
	end
end