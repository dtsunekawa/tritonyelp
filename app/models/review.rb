class Review
  include Mongoid::Document

  ##Content
  field :content,		:type => String
	field :rating, :type => Integer
 
  ##Trackable
  field :created_at, :type => Time

  belongs_to :user
  belongs_to :store
  has_many :tags, :dependent => :destroy
  accepts_nested_attributes_for :tags
  has_many :uservotes

  # This throws an error when creating a Review
  #references_many :tags

end
