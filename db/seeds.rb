# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



###########################
# How to seed database
# run these commands
# Don't run this! 			bundle exec rake db:drop
# Don't run this either !!	bundle exec rake db:create_indexes
# Just this 				bundle exec rake db:seed
###########################


breakfast = '#breakfast'
lunch = '#lunch'
sandwich = '#sandwich'
burrito = '#burrito'
bagel = '#bagel'
coffee = '#coffee'
sandwich = '#sandwich'
healthy = '#healthy'
unhealthy = '#unhealthy'
gross = '#gross'
expensive = '#expensive'
inexpensive = '#inexpensive'
water_refill = '#water_refill'
free = '#free'
chicken = '#chicken'
asian = '#Asian'
ibs = '#IBS'
burger = '#burger'
american = '#American'
stingy = '#stingy'
indian = '#indian'
snacks = '#snacks'
drinks = '#drinks'
convenient = '#convenient'

puts 'Purging database...'
Mongoid.purge!

puts 'Creating admin...'
admin = User.create!(name: 'admin', email: 'admin@ucsd.edu', lname: 'admin', role: 'admin', password: 'password')
puts 'Admin ' << admin.name << ' ' << admin.lname << ' created.'

puts 'Creating merchants...'

cups_merchant = User.create! :name => 'Stevie', :lname => 'Johnson', :role => 'merchant', :email => 'sjohnson@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << cups_merchant.name << ' created.'

goodys_merchant = User.create! :name => 'Matt', :lname => 'Ryan', :role => 'merchant', :email => 'mryan@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << goodys_merchant.name << ' created.'

panda_merchant = User.create! :name => 'Ray', :lname => 'Rice', :role => 'merchant', :email => 'rrice@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << panda_merchant.name << ' created.'

subway_merchant = User.create! :name => 'Torrey', :lname => 'Smith', :role => 'merchant', :email => 'tsmith@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << subway_merchant.name << ' created.'

bombay_merchant = User.create! :name => 'Cecil', :lname => 'Shorts', :role => 'merchant', :email => 'cshorts@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << bombay_merchant.name << ' created.'

bk_merchant = User.create! :name => 'Brandon', :lname => 'Lloyd', :role => 'merchant', :email => 'blloyd@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << bk_merchant.name << ' created.'

sunshine_merchant = User.create! :name => 'Doug', :lname => 'Martin', :role => 'merchant', :email => 'dmartin@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << sunshine_merchant.name << ' created.'


puts 'Creating customers...'

nico_p = User.create(name: 'Nico', lname: 'Pappagianis', email: 'nico@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << nico_p.name << ' ' << nico_p.lname << ' created.'

josh_g = User.create(name: 'Josh', lname: 'Gilless', email: 'josh@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << josh_g.name << ' ' << josh_g.lname << ' created.'

dan_t = User.create(name: 'Dan', lname: 'Tsunekawa', email: 'dan@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << dan_t.name << ' ' << dan_t.lname << ' created.'

john_s = User.create(name: 'John', lname: 'Sabilla', email: 'john@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << john_s.name << ' ' << john_s.lname << ' created.'

tuan_b = User.create(name: 'Tuan', lname: 'Bui', email: 'tuan@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << tuan_b.name << ' ' << tuan_b.lname << ' created.'

matt_n = User.create(name: 'Matt', lname: 'Nyugen', email: 'matt@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << matt_n.name << ' ' << matt_n.lname << ' created.'

cam_j = User.create(name: 'Cam', lname: 'Juarez', email: 'cam@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << cam_j.name << ' ' << cam_j.lname << ' created.'

ingolf_k = User.create(name: 'Ingolf', lname: 'Krueger', email: 'ingolf@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << ingolf_k.name << ' ' << ingolf_k.lname << ' created.'

jack_b = User.create(name: 'Jack', lname: 'Bauer', email: 'jack@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << jack_b.name << ' ' << jack_b.lname << ' created.'







puts 'Creating stores...'

cups_store = Store.create! :name => 'Cups Coffee Cart', :avg_rating => 3.5, :avg_price => 3, :x_coord => 48.89, :y_coord => 67.93, 
	:description => "Cups Coffee Cart has an assortment of excellent coffee beverages including are campus-famous Granite Bear Special. \
	We also have homemade sandwiches that that will entice the vegetarians and carnivores alike.\
	Come to Cups Coffe Cart today! We are conveniently located between Atkinson Hall and the Computer Science and Engineering (EBU3) building."
cups_store.user = cups_merchant._id
cups_store.save!
cups_merchant.stores << cups_store
cups_merchant.save!
puts cups_store.name << ' created.'

cups_store_rating_1 = Rating.create! :stars => 3, :store => cups_store, :user => jack_b



goodys_store = Store.create! :name => 'Goody\'s Place and Market', :avg_rating => 4.5, :avg_price => 3, :x_coord => 48.89, :y_coord => 67.93, 
	:description => "Best known for authentic South-of-the-Border style food, like big burritos, Baja salad bowls, and other Mexican entrees. \
	Not in the mood for Latin food? The deli features a distinct variety of fresh artisan sandwiches and refreshing sides, as well as an \
	outdoor walk-up window for coffee drinks. Location: Thurgood Marshall Activity Center"
goodys_store.user = goodys_merchant._id
goodys_store.save!
goodys_merchant.stores << goodys_store
goodys_merchant.save!
puts goodys_store.name << ' created.'

cups_store_rating_2 = Rating.create! :stars => 4, :store => goodys_store, :user => tuan_b


panda_store = Store.create! :name => 'Panda Express', :avg_rating => 2.5, :avg_price => 3, :x_coord => 48.89, :y_coord => 67.93, 
:description => "Panda Express brings you the Chinese food made from scratch using the best ingredients nature has to offer.\ 
All of our food is MSG free hand made with your health in mind! Come visit us, we are located on the first floor of Price Center!"
panda_store.user = panda_merchant._id
panda_store.save!
panda_merchant.stores << panda_store
panda_merchant.save!
puts panda_store.name << ' created.'

cups_store_rating_3 = Rating.create! :stars => 2, :store => panda_store, :user => matt_n



bk_store = Store.create! :name => 'Burger King', :avg_rating => 2.5, :avg_price => 2, :x_coord => 48.89, :y_coord => 67.93, 
:description => "Every day, more than 11 million guests visit BURGER KING restaurants around the world. And they do so because \
our restaurants are known for serving high-quality, great-tasting, and affordable food. Founded in 1954, BURGER KING is the \
second largest fast food hamburger chain in the world. The original HOME OF THE WHOPPER, our commitment to premium ingredients, \
signature recipes, and family-friendly dining experiences is what has defined our brand for more than 50 successful years.\ 
We are located on the first floor of Price Center."
bk_store.user = bk_merchant._id
bk_store.save!
bk_merchant.stores << bk_store
bk_merchant.save!
puts bk_store.name << ' created.'

cups_store_rating_4 = Rating.create! :stars => 3, :store => bk_store, :user => jack_b


subway_store = Store.create! :name => 'Subway', :avg_rating => 3, :avg_price => 2, :x_coord => 48.89, :y_coord => 67.93, 
:description => "The SUBWAY brand is the world's largest submarine sandwich chain with more than 37,000 locations around the world. \
We've become the leading choice for people seeking quick, nutritious meals that the whole family can enjoy. \
We're located in Price Center at UCSD, come on by!"
subway_store.user = subway_merchant._id
subway_store.save!
subway_merchant.stores << subway_store
subway_merchant.save!
puts subway_store.name << ' created.'

cups_store_rating_5 = Rating.create! :stars => 3, :store => subway_store, :user => ingolf_k


bombay_store = Store.create! :name => 'Bombay Coast', :avg_rating => 1, :avg_price => 3, :x_coord => 48.89, :y_coord => 67.93, 
:description => "If you're looking for Indian food at UCSD, consider Bombay Coast Indian food restaurant. At Bombay Coast, we bring \
you the same wonderful experiences and taste we grew up eating in India. From our exceptional service to the authentic aromas of our \
delicious Indian cuisine to our flavorful and homemade recipes - Bombay Coast brings to you an experience you won't forget. Come visit us \
inside of the Price Center on the first floor."
bombay_store.user = bombay_merchant.id
bombay_store.save!
bombay_merchant.stores << bombay_store
bombay_merchant.save!
puts bombay_store.name << ' created.'

cups_store_rating_6 = Rating.create! :stars => 2, :store => bombay_store, :user => nico_p

sunshine_store = Store.create! :name => 'Sunshine Market', :avg_rating => 5, :avg_price => 3, :x_coord => 48.89, :y_coord => 67.93, 
:description => "Sunshine Market is your one stop shop for all your grocery needs at UCSD. Come try our delicious soups and hand made Zanzibar \
sandwiches. We are located on the first floor of Price Center."
sunshine_store.user = sunshine_merchant._id
sunshine_store.save!
sunshine_merchant.stores << sunshine_store
sunshine_merchant.save!
puts sunshine_store.name << ' created.'

cups_store_rating_7 = Rating.create! :stars => 5, :store => sunshine_store, :user => dan_t


# TritonYelp example of twitter feed
u_merchant5 = User.create! :name => 'TritonYelp', :lname => 'Merchant', :role => 'merchant', :email => 'tritonyelp@tritonyelp.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_merchant5.name

s_tritonyelp = Store.create! :name => 'TritonYelp', :avg_rating => 5, :avg_price => 0, :x_coord => 48.89, :y_coord => 67.93, :twitter_user_name => "https://twitter.com/TritonYelp", :twitter_widget_id => "275482677962997760",
	:description => "Class cse 112 TritonYelp project.  Yelp app just for UCSD student searching for anything UCSD.  Student can search and rate their favorite places."
s_tritonyelp.user = u_merchant5._id
s_tritonyelp.save!
puts 'New store created: ' << s_tritonyelp.name

puts 'Creating reviews for Subway...'

triton_review_1 = Review.create! :content => 'Great App very nice and easy to use.  Definitely recommending to friends and family.', 
:user => dan_t, :store => s_tritonyelp 

triton_review_2 = Review.create! :content => 'Look good, fast and userfriendly.  Really like the ranking feature of rating.', 
:user => josh_g, :store => s_tritonyelp 

s_tritonyelp.reviews << triton_review_1 << triton_review_2

sandwich = Tag.create! :name => 'Yelp', 
:reviews => [triton_review_1, triton_review_2],
:stores => [s_tritonyelp]

cups_store_rating_10 = Rating.create! :stars => 5, :store => s_tritonyelp, :user => cam_j



# seeding reviews
puts 'Creating reviews...'

puts 'Creating reviews for Cups Coffee Cart'

cups_review_1 = Review.create! :content => 'One of the hidden gems of UCSD! So much better than other coffee carts - and the sandwiches are just what I need before a tough mission!', 
:user => jack_b, :store => cups_store, :tag_list => "sandwiches, coffee"
cups_store.add_tags(cups_review_1.tag_list)
cups_store.tag_list

cups_review_2 = Review.create! :content => 'They have different foods for breakfast and lunch, I personally love the breakfast burritos and Bronx Pizza on Thursdays.', 
:user => josh_g, :store => cups_store, :tag_list => "breakfast, lunch, burritos, pizza" 
cups_store.add_tags(cups_review_2.tag_list)
cups_store.tag_list

cups_review_3 = Review.create! :content => 'Perfect for the on the go CS student like me! Very generous with the cream cheese on bagels too!!', 
:user => matt_n, :store => cups_store, :tag_list => "bagels" 
cups_store.add_tags(cups_review_3.tag_list)
cups_store.tag_list

cups_review_4 = Review.create! :content => 'Excellent coffee drinks - Granite Bear Special OP! Beefeater and Muffaleta sandwiches are awesome too.', 
:user => nico_p, :store => cups_store, :tag_list => "sandwiches, coffee, drinks" 
cups_store.add_tags(cups_review_4.tag_list)
cups_store.tag_list



puts 'Creating reviews for Goodys...'

goodys_review_1 = Review.create! :content => 'Excellent burritos for a decent price. Just what I need before a tough mission!', 
:user => jack_b, :store => goodys_store, :tag_list => "burritos"
goodys_store.add_tags(goodys_review_1.tag_list)
goodys_store.tag_list

goodys_review_2 = Review.create! :content => 'Decent sandwich but not worth the price! There\'s a water bottle filling station inside as well.', 
:user => john_s, :store => goodys_store, :tag_list => "sandwich, expensive, water"
goodys_store.add_tags(goodys_review_2.tag_list)
goodys_store.tag_list

goodys_review_3 = Review.create! :content => 'The bowls are pretty good if your\'e looking for something low in carbs, about the average price of any thing decent on campus.', 
:user => dan_t, :store => goodys_store, :tag_list => "healthy"
goodys_store.add_tags(goodys_review_3.tag_list)
goodys_store.tag_list

goodys_review_4 = Review.create! :content => 'I can\'t eat anything from here without needing a bathroom within 10 meters so definiately not worth 6 bucks.', 
:user => nico_p, :store => goodys_store, :tag_list => "IBS, expensive"
goodys_store.add_tags(goodys_review_4.tag_list)
goodys_store.tag_list



puts 'Creating reviews for Panda Express...'

panda_review_1 = Review.create! :content => 'Orange chicken is hit or miss, make sure its fresh or you\'ll be in bathroom all day', 
:user => john_s, :store => panda_store, :tag_list => "chicken, IBS" 
panda_store.add_tags(panda_review_1.tag_list)
panda_store.tag_list

panda_review_2 = Review.create! :content => 'Excellent authentic asian food, you can definately tell how fresh everything is. Orange chicken is soooo goooood!', 
:user => josh_g, :store => panda_store, :tag_list => "Asian, healthy, chicken" 
panda_store.add_tags(panda_review_2.tag_list)
panda_store.tag_list

panda_review_3 = Review.create! :content => 'The chow mein was dry and old, definiately not coming back here ever again.', 
:user => matt_n, :store => panda_store, :tag_list => "gross, unhealthy" 
panda_store.add_tags(panda_review_3.tag_list)
panda_store.tag_list

panda_review_4 = Review.create! :content => 'Just ate bad orange chicken - was in the bathroom all day. Beware!!!!!!', 
:user => nico_p, :store => panda_store, :tag_list => "chicken, IBS" 
panda_store.add_tags(panda_review_4.tag_list)
panda_store.tag_list


puts 'Creating reviews for Burger King...'

bk_review_1 = Review.create! :content => 'A classic American establishment - you can always depend on the whopper! BK Big Fish is just as good as it always was!', 
:user => jack_b, :store => bk_store, :tag_list => "American, burger, fish, sandwich, quality"
bk_store.add_tags(bk_review_1.tag_list)
bk_store.tag_list

bk_review_2 = Review.create! :content => 'Microwaved burgers, cold french fries, and a melted shake! Waste of 8 dollars!', 
:user => tuan_b, :store => bk_store, :tag_list => "gross, burgers, fries, shake, expensive"
bk_store.add_tags(bk_review_2.tag_list)
bk_store.tag_list

bk_review_3 = Review.create! :content => 'Best dollar menu on campus, I always get chicken tenders, fries, and a drink - great deal if you don\'t want to spend 10 bucks at Goodys', 
:user => cam_j, :store => bk_store, :tag_list => "inexpensive, chicken, fries, drink"
bk_store.add_tags(bk_review_3.tag_list)
bk_store.tag_list

bk_review_4 = Review.create! :content => 'Great for a professor on the go - speaking of great, this is by far the most robust, extensible, maintainable, testable and verifiable, modular applications I have EVER laid eyes upon. A+ jobs guys, A+ job.', 
:user => ingolf_k, :store => bk_store, :tag_list => "amazing, ruby, on, rails, application, A+"
bk_store.add_tags(bk_review_4.tag_list)
bk_store.tag_list


puts 'Creating reviews for Subway...'

subway_review_1 = Review.create! :content => 'Stingy with the meat and cheese, they actually took a cheese OFF when they noticed there was one too many - RIDICULOUS!', 
:user => dan_t, :store => subway_store, :tag_list => "stingy, sandwich"
subway_store.add_tags(subway_review_1.tag_list)
subway_store.tag_list

subway_review_2 = Review.create! :content => 'Good enough when your\'e on campus, not too expensive and same Subway \'quality\'', 
:user => josh_g, :store => subway_store, :tag_list => "sandwich, inexpensive, average"
subway_store.add_tags(subway_review_2.tag_list)
subway_store.tag_list

subway_review_3 = Review.create! :content => 'Wilted veggies and cheap meat and manufactured cheese!!!! No thanks.', 
:user => john_s, :store => subway_store, :tag_list => "gross, sandwich"
subway_store.add_tags(subway_review_3.tag_list)
subway_store.tag_list 

subway_review_4 = Review.create! :content => 'I\'d much rather, go to Cups or Goodys and spend a few more bucks than eat Subway and be hunugry in 30 minutes....',
:user => nico_p, :store => subway_store, :tag_list => "stingy, sandwich"
subway_store.add_tags(subway_review_4.tag_list)
subway_store.tag_list


puts 'Creating reviews for Bombay Coast...'

bombay_review_1 = Review.create! :content => 'Uuuhhh....If you\'ve ever had Indian food then you know this is not it', 
:user => tuan_b, :store => bombay_store, :tag_list => "Indian, gross"
bombay_store.add_tags(bombay_review_1.tag_list)
bombay_store.tag_list

bombay_review_2 = Review.create! :content => 'The panner masala tiki daal naan is really good, and pretty cheap compared to other places!', 
:user => josh_g, :store => bombay_store, :tag_list => "Indian, amazing, inexpensive"
bombay_store.add_tags(bombay_review_2.tag_list)
bombay_store.tag_list

bombay_review_3 = Review.create! :content => 'Everything tastes the same, not worth the money...I doubt the authenticity of this locale!!!!	', 
:user => cam_j, :store => bombay_store, :tag_list => "gross, expensive"
bombay_store.add_tags(bombay_review_3.tag_list)
bombay_store.tag_list

bombay_review_4 = Review.create! :content => 'The paneer masala and dal aren\'t too bad, but Punjabi Tandoor puts this place to shame.',
:user => matt_n, :store => bombay_store, :tag_list => "Indian, average"
bombay_store.add_tags(bombay_review_4.tag_list)
bombay_store.tag_list


puts 'Creating reviews for Sunshine Market...'

sunshine_review_1 = Review.create! :content => 'Decent assortment of groceries, drinks, snacks, etc. Really good soup, really keeps me warm on a mission.', 
:user => jack_b, :store => sunshine_store, :tag_list => "groceries, drinks, snacks, soup, variety"
sunshine_store.add_tags(sunshine_review_1.tag_list)
sunshine_store.tag_list

sunshine_review_2 = Review.create! :content => 'I never buy anything from here as its too expensive, but I fill up my water bottle with cold water from the soda fountain, \
get hot water for tea from the hot water dispenser, and get plasticware and napkins almost daily. So... yeah great store.', 
:user => nico_p, :store => sunshine_store, :tag_list => "expensive, free"
sunshine_store.add_tags(sunshine_review_2.tag_list)
sunshine_store.tag_list

sunshine_review_3 = Review.create! :content => 'Somethings are absurdly expensive others regularly priced. Snicker bars for example are like 75 cents. But a bag of chips like 5 bukcs.', 
:user => john_s, :store => sunshine_store, :tag_list => "expensive, inexpensive, candy, snacks"
sunshine_store.add_tags(sunshine_review_3.tag_list)
sunshine_store.tag_list

sunshine_review_4 = Review.create! :content => 'One of the few markets so the prices are ridiculous, but the line moves fast and they have a decent selection.',
:user => matt_n, :store => sunshine_store, :tag_list => "expensive, convenient, variety"
sunshine_store.add_tags(sunshine_review_4.tag_list)
sunshine_store.tag_list

