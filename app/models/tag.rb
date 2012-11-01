class Tag
  include Mongoid::Document


  	field :name, 			:type => String

	referenced_in :review
end
