class ReviewsController < ApplicationController
	
	before_filter :require_customer, :only => [:new, :create, :edit, :delete]

	def index
		@reviews = Review.all
	end

	def new
		@store = Store.find(params[:store_id])
		@review = Review.new

		if(current_user.stores.include?(@store))
			redirect_to @store, :flash => { :error => "You can't write a review for your own store!" }
			return
		end

		respond_to do |format|
			format.html
			format.json {render :json => @review}
		end
	end

	def create

		@review = Review.new(params[:review])
		@review.user = current_user
		@review.store = params[:store_id] 
		@store = Store.find(params[:store_id])
		@store.add_tags(@review.tag_list)
		@store.tag_list


		respond_to do |format|
			if @review.save and @store.save
				format.html {redirect_to @review.store, :notice => 'Review was successfully created'}
			else
				format.html { render :action => 'new' }
				format.json { render :json => @review.errors, :status => :unprocessable_entity }
			end
		end
	end

	def update
		@review = Review.find(params[:id])
		@store = @review.store
		
		# Tag Logic for adding and removing tags
		new_tags = params[:review][:tag_list].split(',')
		tags_to_add = []
		tags_to_remove = []
		@review.tags.each do |tag|
			if new_tags.grep(/(^#{Regexp.quote(tag.name)}$)/i).empty?
				tags_to_remove << tag.name
			end
		end

		new_tags.each do |tag_name|
			if @review.tags.grep(/(^#{Regexp.quote(tag_name.gsub(/\s+/, ""))}$)/i).empty?
				tags_to_add << tag_name
			end
		end

		@store.remove_tags(tags_to_remove.join(','))
		@store.add_tags(tags_to_add.join(','))
		@store.tag_list

		respond_to do |format|
			if @review.update_attributes(params[:review]) and @store.save
				format.html { redirect_to @review.store, :notice => 'Review was successfully updated.' }
				format.json { head :no_content }
			else
				format.html { render :action => 'edit' }
				format.json { render :json => @review.errors, :status => :unprocessable_entity }
			end
		end
		
	end


	def edit
		@review = Review.find(params[:id])
		@store = @review.store

		if(!current_user.reviews.include?(@review) and !current_user.is_admin?)
     		redirect_to root_path, :flash => { :error => 'You may only edit your own reviews!' }
    	end
	end
	
	def destroy
		review = Review.find(params[:id])
		review.destroy
		
		respond_to do |format|
			format.html { redirect_to :back, :notice => 'Review was successfully removed.' }
		end
	end
end
