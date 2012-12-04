class Tag
  include Mongoid::Document
  	field :name, :type => String
  	field :popularity, :type => Integer, :default => 0

	belongs_to :review
	belongs_to :store
	has_one :review
	has_one :store


	def to_str
		self.name
	end

end
