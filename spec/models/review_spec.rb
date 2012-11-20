require 'spec_helper'

describe Review do

	before(:each) do
		u_cust = User.create! :name => 'John', :lname => 'Doe', :role => 'customer', \
		:email => 'johndoe@gmail.com', :password => 'please', \
		:password_confirmation => 'please'

		u_merchant = User.create! :name => 'Kevin', :lname => 'Huang', :role => 'merchant', 
		:email => 'kevinhuang@gmail.com', :password => 'please', 
		:password_confirmation => 'please'

		s_cse_lab = Store.create! :name => 'Cse Lab', :avg_rating => 9.9, :avg_price => 0.0, :x_coord => 48.89, :y_coord => 67.93
		s_cse_lab.user = u_merchant._id
		s_cse_lab.save!

		r_user_lab = Review.create! :content => 'So loud!'
		r_user_lab.user = u_cust._id
		r_user_lab.store = s_cse_lab._id
		r_user_lab.save!
	end
end
