class UsersController < ApplicationController

before_filter :require_admin, :only => [:index, :delete]

  def index
  	@users = User.all
  end

  def show
  	@users = User.find(params[:id])
  end

  def edit
    @users = User.find(params[:id])
  end 

	def show_stores
		@user = User.find(params[:id])
	end

  def create
  	@users = User.new
  end

  def update
    @users = User.find(params[:id])
    if(@users.update_attributes(params[:user]))
      redirect_to :action => 'index'
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
