class ApplicationController < ActionController::Base
  protect_from_forgery

#For Authentication, use a before_filter
#An admin is a merchant, a merchant is a customer

	def require_customer
		if(!user_signed_in?)
			redirect_to '/users/sign_in', :flash => { :error => 'You must be signed in!' }
		end		
	end

	def require_merchant
		if(!user_signed_in? or (!current_user.is_merchant? and !current_user.is_admin?))
			redirect_to root_path, :flash => { :error => 'You must be a merchant or administrator to use that action!' }
		end		
	end

	def require_admin
		if(!user_signed_in? or (!current_user.is_admin?))
			redirect_to root_path, :flash => { :error => 'You must be an administrator to use that action!' }
		end			
	end
end
