class ReviewsController < ApplicationController
	
	before_filter :require_customer, :only => [:new, :create, :edit, :delete]

	def index
		@reviews = Review.all
	end

	def new
		@store = Store.find(params[:store_id])
		@tags = Tag.all_unique
		@review = Review.new
		respond_to do |format|
			format.html
			format.json {render :json => @review}
		end
	end

	def create
		tag_list = params[:review][:tag_names] || []
		@review = Review.new(params[:review])
		@review.user = current_user
		@review.store = params[:store_id] 
		respond_to do |format|
			if @review.save!

				#create all tags
				tag_list.each do |tag_name|
					tag = @review.tags.new( :name => tag_name )
					puts tag.name

					tag.save
				end

				format.html {redirect_to root_path, :notice => 'Review was successfully created'}
			else
				format.html {render :action => "new"}
			end
		end
	end

	def edit
		@review = Review.find(params[:id])
	end
	
	def delete
		Review.delete_all
	end
end
