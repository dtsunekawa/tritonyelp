class StoresController < ApplicationController

	before_filter :require_merchant, :only => [:new, :create, :edit, :update]

# <<<<<<< HEAD
  	def index
		@stores = Store.all

# =======
#   def index
# 		if params[:search]
# 			@stores = Store.search(params[:search])
# 		else
# 			@stores = Store.all
# 		end
# >>>>>>> 345ca50918d868c6d2dd7b649a06ddc56d47216d
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
		params[:store][:user_id] = current_user.id
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
		@store = Store.find(params[:id])
		respond_to do |format|
			if @store.update_attributes(params[:store])
				format.html { redirect_to @store, :notice => 'Store was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render :action => 'edit' }
				format.json { render :json => @store.errors, :status => :unprocessable_entity }
			end
		end
		
	end

	def destroy
		@store = Store.find(params[:id])
		@store.destroy

		respond_to do |format|
			format.html { redirect_to stores_path }
			format.json { head :no_content }
		end
	end


end
