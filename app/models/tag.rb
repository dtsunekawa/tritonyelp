class Tag
  include Mongoid::Document
  	field :name, 			:type => String

	belongs_to :review 

	# returns array of names of most popular tags
	def Tag.most_popular(threshold)
		hash = Tag.all_unique # returns a list of names sorted by popularity
		names = Array.new

		hash.each_with_index do |name, index|
			if index >= threshold
				return names
			end

			names << hash[name]
		end
	end

	# returns a hash of all unique tag names and their counts
	def Tag.all_unique
		tag_list = Hash.new

		all_tags = Tag.all

		all_tags.each do |t|
			if tag_list.has_key?( t.name )
				tag_list[t.name] = 1 
			else
				tag_list[t.name] = 1 + tag_list[t.name].to_i
			end 
		end

		# sort by value in descending order
		tag_list.sort_by {|k,v| v}.reverse
		#tag_list.metrics.sort_by{|name, count| count}.reverse

		return tag_list
	end

end
