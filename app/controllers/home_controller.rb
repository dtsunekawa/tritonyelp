class HomeController < ApplicationController
  def index
    @admins = Admin.all
  end
end
