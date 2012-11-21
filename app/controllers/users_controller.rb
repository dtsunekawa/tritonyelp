class UsersController < ApplicationController
#class UsersController < Devise::RegistrationsController
  def index
  	@users = User.all
  end

  def show
  	@users = User.find(params[:id])
		
  end

	def show_stores
		@user = User.find(params[:id])
	end

  def create
  	@users = User.new
  end

  def update
    users = User.find(params[:id])
  end


  def delete
    if(current_user.is_admin?)
      User.find(params[:id]).destroy
       flash[:notice] = "user deleted."
       redirect_to :controller => 'users' , :action => :index 
    else
       flash[:notice] = "you are not an admin."
       redirect_to :controller => 'users' , :action => :index 
    end

  end 

  
  #def delete
  #  user = User.where('id = ?', params[:id])

  #  if(user.is_admin?)
  #      user.destroy
  #      render('index')
  #  else
    	#display a message
  #  end
  #end


 

  
end
