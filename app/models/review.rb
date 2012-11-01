class Review
  include Mongoid::Document

  field :content,		:type => String
  references_one :user
  references_many :tags
end
