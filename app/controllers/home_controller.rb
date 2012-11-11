class HomeController < ApplicationController

	def index
		if(user_signed_in?)
		    @name = current_user.name
		    @role = current_user.role
	    end
	end
	
end
