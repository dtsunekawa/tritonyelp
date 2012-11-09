class ReviewsController < ApplicationController
	def index
		##Index shit goes here
	end

		##Create Review
		def new
			@review = review.new
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
