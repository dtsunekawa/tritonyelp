class Review
  include Mongoid::Document

  field :content,		:type => String
  embeds_one :user
end
