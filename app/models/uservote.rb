class Uservote
  include Mongoid::Document

	field :upvote, :type => Integer
	#field :reviewerid, :type => String

	belongs_to :review, :foreign_key => "review_id"
	belongs_to :user, :foreign_key => "user_id"
    
	def self.check_exists(user_id, review_id)

		upvote = Uservote.where('user_id' => user_id , 'review_id' => review_id).first

		if upvote.nil?
			return false
		else
		    return true
		end
    end

    def self.upvote(user_id,review_id)
    	uservote = Uservote.new
    	uservote.user_id = user_id
    	uservote.review_id = review_id
    	uservote.upvote = 1
    	uservote.save! 
   	end

   	def self.upcount(review_id)
   		uservote = Uservote.where('review_id' => review_id, 'upvote' => 1).count

   		return uservote
   	end

end