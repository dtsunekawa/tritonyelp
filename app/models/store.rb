class Store
  include Mongoid::Document
	
	has_many :reviews
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
