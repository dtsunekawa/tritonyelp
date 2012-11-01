class UsersController < ApplicationController

  def index
  	show
  		#@users = User.first
  end




  def show
  	@users = User.first
  end
end
