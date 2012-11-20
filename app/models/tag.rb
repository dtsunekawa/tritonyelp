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
				tag_list[t.name] += 1
			else
				tag_list[t.name] = 1 
			end 
		end

		# sort by value in descending order
		tag_list.sort_by {|k,v| v}.reverse

		# print all keys and vals for debugging
		tag_list.each_pair do |name, count|
			puts name
			puts count
		end

		return tag_list
	end

	# create tags for a single review, passing in an array of tag names and a review obj
	def self.create_tags( tag_array, review  )
		tag_array.uniq# remove any duplicate tag_names in the array

		tag_array.each do |tag_name|

			tag_name = tag_name.strip	# remove leading and trailing whitespace
			puts tag_name

			next if tag_name.blank?	# skip any empty strings

			tag = Tag.new( :name => tag_name )
			tag.review = review
			tag.save
		end
	end

end
