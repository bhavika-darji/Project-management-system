class ApplicationController < ActionController::Base
	private   
    def current_user  
      Login.where(id: session[:checkuser_id] ).first   
    end   
    helper_method :current_user 
end
