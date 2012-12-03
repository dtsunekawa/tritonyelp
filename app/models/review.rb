class Review
  include Mongoid::Document

  has_and_belongs_to_many :tags
  attr_accessor :tag_list

  ##Content
  field :content,		:type => String
  field :price, :type => Integer
  validates_length_of :content, :minimum => 60, :maximum => 1000
 
  ##Trackable
  field :created_at, :type => Time

  belongs_to :user
  belongs_to :store
  has_many :uservotes, :dependent => :destroy

  def tag_list=value
    self.tags = nil
    value.split(',').each do |tag|
      self.tags.build(:name => tag).save
    end
  end

  def tag_list
    self.tags.join(',')
  end  

  # This throws an error when creating a Review
  #references_many :tags

end
