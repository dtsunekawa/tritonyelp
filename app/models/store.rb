class Store
  include Mongoid::Document
	include Mongoid::Paperclip

	has_many :reviews
	has_many :ratings
	has_many :tags
  	

	# For image uploading
	has_mongoid_attached_file :image, :styles => { :banner => "600>", :thumb => "100x100>", :search_thumb => "290x190>" },
	:url => "/user_images/:id/:style/:basename.:extension",
	:path => ":rails_root/public/user_images/:id/:style/:basename.:extension"

	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/png', 'image/jpeg']
	validates :name, :presence => true
	validates_length_of :description, :minimum => 140

	belongs_to :user

	field :tag_list, :type => String
  	field :name, :type => String
	field :description, :type => String
	field :x_coord, :type => Float
	field :y_coord, :type => Float
	field :avg_rating, :type => Float
	field :avg_price, :type => Float

	def self.search(search)
		if search
			result = any_of({ name: /(#{Regexp.quote(search)})/i }, { description: /(#{Regexp.quote(search)})/i }, { tag_list: /(#{Regexp.quote(search)})/i } )
		else
			all
		end
	end

	def avg_rating
		average_rating = 0.0
		count = 0
		ratings.each do |rating| 
			average_rating += rating.stars
			count += 1
		end
		
		if count != 0
			(average_rating / count).round(2)
		else
			count
		end
	end

	def avg_rating_str
		average_rating = avg_rating
		if(average_rating > 1)
			(average_rating).to_s + " stars"
		elsif(average_rating == 1)
			(average_rating).to_s + " star"
		else
			average_rating
		end
	end

	# Tag system

  	def add_tags value
  	    value.split(',').each do |tag|
  	    	if !(temp = self.tags.find_by(name: /(^#{Regexp.quote(tag.gsub(/\s+/, ""))}$)/i))
				self.tags.build(name: tag.gsub(/\s+/, "")).save
			else
				temp.popularity += 1
				temp.save	
			end
    	end

  	end

  	def remove_tags value
  		 value.split(',').each do |tag|
      		if (temp = self.tags.find_by(name: /(^#{Regexp.quote(tag.gsub(/\s+/, ""))}$)/i))
      			if temp.popularity < 1
      				temp.destroy
      			else
      				temp.popularity -= 1
      				temp.save
      			end
      		end
    	end

  	end

  	# Necessary for search by tags functionality
  	def tag_list
    	self.tag_list = self.tags.join(',')
  	end  

  	# To be called in views with .html_safe
  	def display_tags limit
  		rstring = ""
  		self.tags.sort{ |tag1, tag2| tag2.popularity <=> tag1.popularity }[0,limit].each do |tag| 
  			rstring += "<a href=\"/search?utf8=%E2%9C%93&key=#{tag.to_str}\">\##{tag.to_str}</a> "
  		end
  		rstring
  	end

end
