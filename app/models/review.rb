class Review
  include Mongoid::Document

  ##Content
  field :content,		:type => String
  field :price, :type => Integer
  validates :content, :presence => true
 
  ##Trackable
  field :created_at, :type => Time

  belongs_to :user
  belongs_to :store
  has_many :tags, :dependent => :destroy
  accepts_nested_attributes_for :tags
  has_many :uservotes, :dependent => :destroy

  # This throws an error when creating a Review
  #references_many :tags

end
