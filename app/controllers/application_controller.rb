class ApplicationController < ActionController::Base
  protect_from_forgery

#For Authentication, use a before_filter

	def require_merchant
		if(!user_signed_in? or (!current_user.is_merchant and !current_user.is_admin))
			redirect_to root_path, :notice => 'You must be a merchant or administrator to use this action!'
		end		
	end

	def require_admin
		if(!user_signed_in? or (!current_user.is_admin))
			redirect_to root_path, :notice => 'You must be an administrator to use this action!'
		end			
	end
end
