# +require 'spec_helper'

describe Store do
	before(:each) do

		u_merchant = User.create! :name => 'Kevin', :lname => 'Huang', :role => 'merchant', :email => 'kevinhuang@gmail.com', :password => 'please', :password_confirmation => 'please'
		s_cse_lab = Store.create! :name => 'Cse Lab', :avg_rating => 9.9, :avg_price => 0.0, :x_coord => 48.89, :y_coord => 67.93 
		s_cse_lab.user = u_merchant._id
		s_cse_lab.save!

		s_burger_king = Store.create! :name => 'Burger_king', :avg_rating => 5.5, :avg_price => 5.29, :x_coord => 48.89, :y_coord => 67.93
		s_burger_king.user = u_merchant._id
		s_burger_king.save!

	end

	describe "#search" do
		context "Exact search match finds and returns an existing store" do
			it "should return the store found by the exact match search string" do
				Store.search("Cse Lab").first.name.should == "Cse Lab"
			end
		end
		context "Partial search match finds and returns an existing store" do
			it "should return the store found by the partial match search string" do
				Store.search("cse").first.name.should == "Cse Lab"
			end
		end
		context "No search match finds no matching store" do
			it "should not return any stores" do
				Store.search("Burger Queens").size.should == 0
			end
		end
		context "No parameters are passed in to search" do
			it "should return all stores" do
				Store.search("").size.should == 2
			end
		end
	end

end
