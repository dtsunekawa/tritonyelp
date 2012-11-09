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
		end

		##Update Review
		def edit
			@review = review.find(params[:id])
		end

		##Destroy Review
		def delete
		end

end
