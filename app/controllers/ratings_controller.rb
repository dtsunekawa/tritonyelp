class RatingsController < ApplicationController

		before_filter :require_customer

	def update
		@rating = Rating.find(params[:id])
		@store = Store.find(params[:rating][:store_id])
		@rating.update_attributes(params[:rating])
		respond_to do |format|
			if @rating.save
				format.html { redirect_to @store }
				format.json { render :json => @rating, :status => :created, :location => @rating }
			else
				format.html { render :action => "new" }
				format.json { render :json => @rating.errors, :status => :unprocessable_entity }
			end
		end

	end

 	def create
   		@rating = Rating.new(params[:rating])
   		@store = Store.find(params[:rating][:store_id])

   		respond_to do |format|
			if @rating.save
				format.html { redirect_to @store }
				format.json { render :json => @rating, :status => :created, :location => @rating }
			else
				format.html { render :action => "new" }
				format.json { render :json => @rating.errors, :status => :unprocessable_entity }
			end
		end

  	end


end