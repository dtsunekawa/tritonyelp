class HomeController < ApplicationController

	def index
		if(user_signed_in?)
		    @name = current_user.name
		    @role = current_user.role
	    end

	    if signed_in? 
	    	@placeholder = "Welcome back, #{current_user.name} what can we help you find? (e.g. Pizza)"
		else 
			@placeholder = 'Welcome to TritonYelp, what can we help you find? (e.g. Pizza)'
		end 


		@stores = Store.all


	end
	
end
