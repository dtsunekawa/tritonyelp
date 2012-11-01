class Review
  include Mongoid::Document

  field :content,		:type => String
  belongs_to :user
  belongs_to :store

  # This throws an error when creating a Review
  #references_many :tags

end
