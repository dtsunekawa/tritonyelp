class ReviewsController < ApplicationController
	def index
		##Index shit goes here
	end

		##New
		def new
			@review = review.new
			respond_to do |format|
				format.html
				format.json {render :json => @review}
		end

		##Create Review
		def create
			@review = review.new(params[:review])
			respond_to do |format|
				if @review.save
					format.html {redirect_to @review :notice => "Review was successfully created"}
					format.json {render :json => @review :status => :created}
				else
					format.html {render :action => "new"}
					format.json {render :json => @review.errors, :status => :unprocessable_entity}
				end
			end

		end

		##Read Review
		def show
			@Review = Review.find(params[:id])
		end

		##Update Review
		def edit
			@review = Review.find(params[:id])
		end

		##Destroy Review
		def delete
			Review.delete_all
		end

end
