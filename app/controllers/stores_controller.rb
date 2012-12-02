class StoresController < ApplicationController

	before_filter :require_merchant, :only => [:new, :create, :edit, :update]

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

	def search
	 	@stores = Store.search(params[:key])
	 	if @stores.empty?
	 		redirect_to root_path, :notice => "No results were found for '#{params[:key]}'." and return
	 	end

	 	respond_to do |format|
			format.html
			format.json { render :json => @stores }
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
				format.html { redirect_to @store, :notice => "#{@store.name} was successfully created." }
				format.json { render :json => @store, :status => :created, :location => @store }
			else
				format.html { render :action => "new" }
				format.json { render :json => @store.errors, :status => :unprocessable_entity }
			end
		end
	end

	def edit
		@store = Store.find(params[:id])

		if !(user_signed_in? and (current_user.stores.include?(@store) or current_user.role == 'admin'))
			redirect_to root_path, :flash => { :error => "You must be the owner of #{@store.name} to edit it!" }
		end
	end

	def update
		@store = Store.find(params[:id])

		if params[:remove_image] == "1"
			@store.image = nil
		end

		respond_to do |format|
			if @store.update_attributes(params[:store])
				format.html { redirect_to @store, :notice => "#{@store.name} was successfully updated." }
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
			format.html { redirect_to :back, :notice => "#{@store.name} was successfully deleted." }
			format.json { head :no_content }
		end
	end

end
