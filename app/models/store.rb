class Store
  include Mongoid::Document
	include Mongoid::Paperclip
	
	has_many :reviews
	has_many :ratings


	# For image uploading
	has_mongoid_attached_file :image, :styles => { :banner => "600>", :thumb => "100x100>" },
	:url => "/user_images/:id/:style/:basename.:extension",
	:path => ":rails_root/public/user_images/:id/:style/:basename.:extension"

	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/png', 'image/jpeg']
	validates :name, :presence => true
	validates_length_of :description, :minimum => 140

	belongs_to :user

  field :name, :type => String
	field :description, :type => String
	field :x_coord, :type => Float
	field :y_coord, :type => Float
	field :avg_rating, :type => Float
	field :avg_price, :type => Float

	def self.search(search)
		if search
			result = any_of({ name: /(#{Regexp.quote(search)})/i }, { description: /(#{Regexp.quote(search)})/i })
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
			(average_rating).to_s + " stars."
		elsif(average_rating == 1)
			(average_rating).to_s + " star."
		else
			average_rating
		end
	end

end
