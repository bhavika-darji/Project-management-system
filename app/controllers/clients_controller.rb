class ClientsController < ApplicationController
	def index
	 	if session[:checkuser_id]
	        @client = Client.all
	  else 
	        flash[:success]="please Login First"
	        redirect_to logins_path
	  end
	end
	def new
		@client = Client.new
	end
	def edit
		@client = Client.find(params[:id])
	end
	def create
		@client = Client.new(client_params)
	 	if @client.save
			redirect_to clients_path
		else
			render 'new'
		end
	end
	def update
		@client = Client.find(params[:id])
		if @client.update(client_params)
			redirect_to clients_path
		else
			render 'edit'
		end
	end
	def destroy
  		@client = Client.find(params[:id])
  		@client.destroy
			redirect_to clients_path
	end
	private
		def client_params
			params.require(:client).permit(:name,:country)
		end
end
