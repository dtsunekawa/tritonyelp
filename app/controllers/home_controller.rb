class HomeController < ApplicationController

	def index
		@name = current_user.name
		@role = current_user.role
	end
end
