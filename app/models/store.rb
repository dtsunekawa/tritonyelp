class Store
  include Mongoid::Document
	include Mongoid::Paperclip
	
	has_many :reviews

	# For image uploading
	has_mongoid_attached_file :image, :styles => { :banner => "600>", :thumb => "100x100>" },
	:url => "/user_images/:id/:style/:basename.:extension",
	:path => ":rails_root/public/user_images/:id/:style/:basename.:extension"

	validates_attachment_size :image, :less_than => 5.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/png', 'image/jpeg']

	belongs_to :user

  	field :name, :type => String
	field :description, :type => String
	field :x_coord, :type => Float
	field :y_coord, :type => Float
	field :avg_rating, :type => Float
	field :avg_price, :type => Float

	def self.search(search)
		if search
			where(name: /(#{Regexp.quote(search)})/i)
		else
			all
		end
	end
end
