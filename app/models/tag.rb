class Tag
  include Mongoid::Document
  	field :name, :type => String
  	field :popularity, :type => Integer, :default => 0

	has_and_belongs_to_many :reviews
	has_and_belongs_to_many :stores

	def to_str
		self.name
	end

end
