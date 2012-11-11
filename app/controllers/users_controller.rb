class UsersController < ApplicationController

  def index
  	@users = User.all
  end


  def show
  	@users = User.find(params[:id])
		
  end

  def create
  	@users = User.new
  end


  def update
    users = User.find(params[:id])
  end

  def delete
    user = User.where('id = ?', params[:id])

    if(user.is_admin?)
        user.destroy
        render('index')
    else
    	#display a message
    end
  end

 

  
end
