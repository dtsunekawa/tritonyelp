class UsersController < ApplicationController

before_filter :require_admin, :only => [:index, :delete]

  def index
  	@users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if(@user != current_user and !current_user.is_admin?)
      redirect_to root_path, :flash => { :error => 'You may only edit your own profile!' }
    end
  end 

	def show_stores
		@user = User.find(params[:id])
	end

  def update
    @user = User.find(params[:id])
    
    if(@user.update_attributes(params[:user]))
      redirect_to :back, :notice => "Profile for #{@user.name} has been updated successfully."
    end

  end

  # deletes store is the user is merchant or admin
  def delete
			user = User.find(params[:id])
			user_first = user.name || ""
			user_last = user.lname || ""

			user.reviews.each { |review| review.destroy }

      if(user.role == 'merchant' || user.role == 'admin')
          user.stores.each { |store| store.destroy }
      end

      user.destroy
      flash[:notice] = "#{user_first} #{user_last} deleted."

      redirect_to :controller => 'users' , :action => :index 
  end 

  
end
