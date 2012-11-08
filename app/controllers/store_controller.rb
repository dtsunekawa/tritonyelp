class StoreController < ApplicationController

  def index
		@stores = Store.all

		respond_to do |format|
			format.html
			format.json { render :json => @stores }
		end
  end
  
	def show
		@store = Store.find(params[:id])
		
		respond_to do |format|
			format.html
			format.json { render :json => @store }
  	end
	end

	def new
		@store = Store.new
		
		respond_to do |format|
			format.html
			format.json { render :json => @store }
  	end
	end
	
	def create
		@store = Store.new(params[:store])
		respond_to do |format|
			if @store.save
				format.html { redirect_to @store, :notice => 'Store was successfully created' }
				format.json { render :json => @store, :status => :created, :location => @store }
			else
				format.html { render :action => "new" }
				format.json { render :json => @store.errors, :status => :unprocessable_entity }
			end
		end
	end

	def edit
		@store = Store.find(params[:id])
	end

	def update
		
	end

	def delete

	end

end
