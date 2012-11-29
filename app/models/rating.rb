class Rating
	include Mongoid::Document

	field :stars, :type => Integer

	belongs_to :store
	belongs_to :user

	
end