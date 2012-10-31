class AdminsController < ApplicationController
  #before_filter :authenticate_user!

  def show
    @admin = Admin.find(params[:id])
  end
end
