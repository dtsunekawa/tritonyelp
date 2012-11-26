class ReviewsController < ApplicationController
	
	before_filter :require_customer, :only => [:new, :create, :edit, :delete]

	def index
		@reviews = Review.all
	end

	def new

		@votes = Uservote.all
		@store = Store.find(params[:store_id])
		@tags = Tag.all_unique
		@review = Review.new
		respond_to do |format|
			format.html
			format.json {render :json => @review}
		end
	end

	def create
		tag_string = params[:tag_string] #retrieve sting of tag names and make it into an array
		tag_list = tag_string.split(/,/)

		@review = Review.new(params[:review])
		@review.user = current_user
		@review.store = params[:store_id] 
		respond_to do |format|
			if @review.save!
				Tag.create_tags( tag_list, @review )
				format.html {redirect_to @review.store, :notice => 'Review was successfully created'}
			else
				format.html {render :action => "new"}
			end
		end
	end

	def update
		@review = Review.find(params[:id])
		respond_to do |format|
			if @review.update_attributes(params[:review])
				format.html { redirect_to root_path, :notice => 'Review was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render :action => 'edit' }
				format.json { render :json => @review.errors, :status => :unprocessable_entity }
			end
		end
		
	end


	def edit
		@review = Review.find(params[:id])
	end
	
	def destroy
		review = Review.find(params[:id])
		review.destroy
		respond_to do |format|
			format.html { redirect_to :back, :notice => 'Review was successfully removed.' }
		end
	end
end
