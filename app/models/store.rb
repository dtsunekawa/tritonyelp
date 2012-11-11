class Store
  include Mongoid::Document
	
	has_many :reviews

    field :name, :type => String
	field :x_coord, :type => Float
	field :y_coord, :type => Float
	field :avg_rating, :type => Float
	field :avg_price, :type => Float

end
