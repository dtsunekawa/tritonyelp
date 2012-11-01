class StoreController < ApplicationController

  def index
  	show
  end




  def show
  	@stores = Store.all
  end
end
