class Review
  include Mongoid::Document

  field :content,		:type => String
  belongs_to :user
  references_one :user
  references_many :tags
end
