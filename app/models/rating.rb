class Rating
	include Mongoid::Document

	field :stars, :type => Integer, :default => 0

	belongs_to :store
	belongs_to :user

	
end