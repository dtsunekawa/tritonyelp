class ReviewsController < ApplicationController

	def index
		@reviews = Review.all
		##Index shit goes here
	end

	##New
	def new
		@store = Store.find(params[:store_id])
		@review = Review.new
		respond_to do |format|
			format.html
			format.json {render :json => @review}
		end
	end

	##Create Review
	def create
		@review = Review.new(params[:review])
		@review.user = current_user
		@review.store = params[:store_id] 
		respond_to do |format|
			if @review.save!
				format.html {redirect_to root_path, :notice => 'Review was successfully created'}
			else
				format.html {render :action => "new"}
			end
		end
	end

	def edit
		@review = Review.find(params[:id])
	end
		##Destroy Review
	def delete
		Review.delete_all
	end
end
