class Review
  include Mongoid::Document

  ##Content
  field :content,		:type => String
	field :rating, :type => Integer
 
  ##Trackable
  field :created_at, :type => Time

  belongs_to :user
  belongs_to :store
  has_many :tags



  # This throws an error when creating a Review
  #references_many :tags

end
