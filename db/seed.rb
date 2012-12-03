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
# bundle exec rake db:drop
# bundle exec rake db:create_indexes
# bundle exec rake db:seed
###########################

puts 'PURGING DATABASE'
Mongoid.purge!

puts 'creating admin...'
admin = User.create!(name: 'admin', email: 'admin@ucsd.edu', lname: 'admin', role: 'admin', password: 'password')

puts 'Creating merchants...'

cups_merchant = User.create! :name => 'Stevie', :lname => 'Johnson', :role => 'merchant', :email => 'sjohnson@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << cups_merchant.name << ' created.'

goodys_merchant = User.create! :name => 'Matt', :lname => 'Ryan', :role => 'merchant', :email => 'mryan@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << goodys_merchant.name << ' created.'

panda_merchant = User.create! :name => 'Ray', :lname => 'Rice', :role => 'merchant', :email => 'rrice@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << panda_merchant.name << ' created.'

subway_merchant = User.create! :name => 'Torrey Smith', :lname => 'Smith', :role => 'merchant', :email => 'tsmith@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << subway_merchant.name << ' created.'

bombay_merchant = User.create! :name => 'Cecil', :lname => 'Shorts', :role => 'merchant', :email => 'cshorts@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << cups_merchant.name << ' created.'

bk_merchant = User.create! :name => 'Brandon', :lname => 'Lloyd', :role => 'merchant', :email => 'blloyd@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << bk_merchant.name << ' created.'

sunshine_merchant = User.create! :name => 'Doug', :lname => 'Martin', :role => 'merchant', :email => 'dmartin@gmail.com', :password => 'password', :password_confirmation => 'password'
puts 'Merchant ' << sunshine_merchant.name << ' created.'


puts 'creating customers...'

nico_p = User.create(name: 'Nico', lname: 'Pappagianis', email: 'nico@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << nico_p.name << ' ' << nico_p.lname << ' created.'

josh_g = User.create(name: 'Josh', lname: 'Gilless', email: 'josh@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << josh_g.name << ' ' << josh_g.lname << ' created.'

dan_t = User.create(name: 'Dan', lname: 'Tsunekawa', email: 'dan@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << dan_t.name << ' ' << dan_t.lname << ' created.'

john_s = User.create(name: 'John', lname: 'Sabilla', email: 'john@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << john_s.name << ' ' << john_s.lname << ' created.'

tuan_b = User.create(name: 'Tuan', lname: 'Bui', email: 'tuan@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << john_s.name << ' ' << john_s.lname << ' created.'

matt_n = User.create(name: 'Matt', lname: 'Nyugen', email: 'matt@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << matt_n.name << ' ' << matt_n.lname << ' created.'

cam_j = User.create(name: 'Cam', lname: 'Juarez', email: 'cam@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << cam_j.name << ' ' << cam_j.lname << ' created.'

ingolf_k = User.create(name: 'Ingolf', lname: 'Krueger', email: 'ingolf@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << ingolf_k.name << ' ' << ingolf_k.lname << ' created.'

jack_b = User.create(name: 'Jack', lname: 'Bauer', email: 'jack@customer.com', role: 'customer', password: 'password')
puts 'Customer ' << jack_b.name << ' ' << jack_b.lname << ' created.'

puts 'creating stores...'

cups_store = Store.create! :name => 'Cups Coffee Cart', :avg_rating => 9.5, :avg_price => 3.34, :x_coord => 48.89, :y_coord => 67.93, 
	:description => "Cups Coffee Cart has an assortment of excellent coffee beverages including are campus-famous Granite Bear Special. \
	We also have homemade sandwiches that that will entice the vegetarians and carnivores alike.\
	Come to Cups Coffe Cart today! We are conveniently located between Atkinson Hall and the Computer Science and Engineering (EBU3) building."
cups_store.user = cups_merchant._id
cups_store.save!
puts cups_store.name << ' created.'

goodys_store = Store.create! :name => 'Goody\'s Place and Market', :avg_rating => 8.7, :avg_price => 6.55, :x_coord => 48.89, :y_coord => 67.93, 
	:description => "Best known for authentic South-of-the-Border style food, like big burritos, Baja salad bowls, and other Mexican entrees. \
	Not in the mood for Latin food? The deli features a distinct variety of fresh artisan sandwiches and refreshing sides, as well as an \
	outdoor walk-up window for coffee drinks. Location: Thurgood Marshall Activity Center"
goodys_store.user = goodys_merchant._id
goodys_store.save!
puts goodys_store.name << ' created.'

panda_store = Store.create! :name => 'Panda Express', :avg_rating => 6.5, :avg_price => 3.66, :x_coord => 48.89, :y_coord => 67.93, 
:description => "Panda Express brings you the Chinese food made from scratch using the best ingredients nature has to offer.\ 
All of our food is MSG free hand made with your health in mind! Come visit us, we are located on the first floor of Price Center!"
panda_store.user = panda_merchant._id
panda_store.save!
puts panda_store.name << ' created.'

bk_store = Store.create! :name => 'Burger King', :avg_rating => 5.5, :avg_price => 1.60, :x_coord => 48.89, :y_coord => 67.93, 
:description => "Every day, more than 11 million guests visit BURGER KING® restaurants around the world. And they do so because \
our restaurants are known for serving high-quality, great-tasting, and affordable food. Founded in 1954, BURGER KING® is the \
second largest fast food hamburger chain in the world. The original HOME OF THE WHOPPER®, our commitment to premium ingredients, \
signature recipes, and family-friendly dining experiences is what has defined our brand for more than 50 successful years.\ 
We are located on the first floor of Price Center."
bk_store.user = bk_merchant._id
bk_store.save!
puts bk_store.name << ' created.'

subway_store = Store.create! :name => 'Subway', :avg_rating => 8.5, :avg_price => 0.05, :x_coord => 48.89, :y_coord => 67.93, 
:description => "The SUBWAY® brand is the world's largest submarine sandwich chain with more than 37,000 locations around the world. \
We’ve become the leading choice for people seeking quick, nutritious meals that the whole family can enjoy. \
We're located in Price Center at UCSD, come on by!"
subway_store.user = subway_merchant._id
subway_store.save!
puts subway_store.name << ' created.'

bombay_store = Store.create! :name => 'Bombay Coast', :avg_rating => 6.5, :avg_price => 3.70, :x_coord => 48.89, :y_coord => 67.93, 
:description => "If you're looking for Indian food at UCSD, consider Bombay Coast Indian food restaurant. At Bombay Coast, we bring \
you the same wonderful experiences and taste we grew up eating in India. From our exceptional service to the authentic aromas of our \
delicious Indian cuisine to our flavorful and homemade recipes – Bombay Coast brings to you an experience you won't forget. Come visit us \
inside of the Price Center on the first floor."
bombay_store.user = bombay_merchant.id
bombay_store.save!
puts bombay_store.name << ' created.'

sunshine_store = Store.create! :name => 'Sunshine Market', :avg_rating => 9.5, :avg_price => 3.00, :x_coord => 48.89, :y_coord => 67.93, 
:description => "Sunshine Market is your one stop shop for all your grocery needs at UCSD. Come try our delicious soups and hand made Zanzibar \
sandwiches. We are located on the first floor of Price Center."
sunshine_store.user = sunshine_merchant._id
sunshine_store.save!
puts sunshine_store.name << ' created.'

# seeding reviews
puts 'Creating reviews...'

puts 'Creating reviews for Cups Coffee Cart'

cups_review_1 = Review.create! :content => 'One of the hidden gems of UCSD! So much better than other coffee carts - and the sandwiches are just what I need before a tough mission!', 
:user => jack_b, :store => cups_store 

cups_review_2 = Review.create! :content => 'They have different foods for breakfast and lunch, I personally love the breakfast burritos and Bronx Pizza on Thursdays.', 
:user => josh_g, :store => cups_store 

cups_review_3 = Review.create! :content => 'Perfect for the on the go CS student like me! Very generous with the cream cheese on bagels too!!', 
:user => matt_n, :store => cups_store 

cups_review_4 = Review.create! :content => 'Excellent coffee drinks - Granite Bear Special OP! Beefeater and Muffaleta sandwiches are awesome too.', 
:user => nico_p, :store => cups_store 


puts 'Creating reviews for Goodys...'

goodys_review_1 = Review.create! :content => 'Excellent burritos for a decent price. Just what I need before a tough mission!', 
:user => jack_b, :store => goodys_store 

goodys_review_2 = Review.create! :content => 'Decent sandwich but not worth the price! There\'s a water bottle filling station inside as well.', 
:user => john_s, :store => goodys_store 

goodys_review_3 = Review.create! :content => 'The bowls are pretty good if your\'e looking for something low in carbs, about the average price of any thing decent on campus.', 
:user => dan_t, :store => goodys_store 

goodys_review_4 = Review.create! :content => 'One of the only foods I can eat on campus without needing a bathroom within 10 meters so definiately worth 6 bucks.', 
:user => nico_p, :store => goodys_store 


puts 'Creating reviews for Panda Express...'

panda_review_1 = Review.create! :content => 'Orange chicken is hit or miss, make sure its fresh or you\'ll be in bathroom all day', 
:user => john_s, :store => panda_store 

panda_review_2 = Review.create! :content => 'Excellent authentic asian food, you can definately tell how fresh everything is. Orange chicken is soooo goooood!', 
:user => josh_g, :store => panda_store 

panda_review_3 = Review.create! :content => 'The chow mein was dry and old, definiately not coming back here ever again.', 
:user => matt_n, :store => panda_store 

panda_review_4 = Review.create! :content => 'Just ate bad orange chicken - was in the bathroom all day. Beware!!!!!!', 
:user => nico_p, :store => panda_store 

puts 'Creating reviews for Burger King...'

bk_review_1 = Review.create! :content => 'A classic American establishment - you can always depend on the whopper! BK Big Fish is just as good as it always was!', 
:user => jack_b, :store => bk_store 

bk_review_2 = Review.create! :content => 'Microwaved burgers, cold french fries, and a melted shake! Waste of 8 dollars!', 
:user => tuan_b, :store => bk_store 

bk_review_3 = Review.create! :content => 'Best dollar menu on campus, I always get chicken tenders, fries, and a drink - great deal if you don\'t want to spend 10 bucks at Goodys', 
:user => cam_j, :store => bk_store

bk_review_4 = Review.create! :content => 'Great for a professor on the go - speaking of great, this is by far the most robust, extensible, maintainable, testable and verifiable, modular applications I have EVER laid eyes upon. A+ jobs guys, A+ job.', 
:user => nico_p, :store => bk_store 

puts 'Creating reviews for Subway...'

subway_review_1 = Review.create! :content => 'Stingy with the meat and cheese, they actually took a cheese OFF when they noticed there was one too many - RIDICULOUS!', 
:user => dan_t, :store => subway_store 

subway_review_2 = Review.create! :content => 'Good enough when your\'e on campus, not too expensive and same Subway \'quality\'', 
:user => josh_g, :store => subway_store 

subway_review_3 = Review.create! :content => 'Wilted veggies and cheap meat - no thanks.', 
:user => john_s, :store => subway_store 

subway_review_4 = Review.create! :content => 'I\'d much rather, go to Cups or Goodys and spend a few more bucks than eat Subway and be hunugry in 30 minutes....'
:user => nico_p, :store => subway_store 

puts 'Creating reviews for Bombay Coast...'

bombay_review_1 = Review.create! :content => 'Uuuhhh....If you\'ve ever had Indian food then you know this is not it', 
:user => tuan_b, :store => bombay_store 

bombay_review_2 = Review.create! :content => 'The panner masala tiki daal naan is really good, and pretty cheap compared to other places!', 
:user => josh_g, :store => bombay_store 

bombay_review_3 = Review.create! :content => 'Everything tastes the same, not worth the money...', 
:user => cam_j, :store => bombay_store

bombay_review_4 = Review.create! :content => 'The paneer masala and dal aren\'t too bad, but Punjabi Tandoor puts this place to shame.'
:user => matt_n, :store => bombay_store 

puts 'Creating reviews for Sunshine Market...'

sunshine_review_1 = Review.create! :content => 'Decent assortment of groceries, drinks, snacks, etc. Really good soup, really keeps me warm on a mission.', 
:user => jack_b, :store => sunshine_store 

sunshine_review_2 = Review.create! :content => 'I never buy anything from here as its too expensive, but I fill up my water bottle with cold water from the soda fountain, \
get hot water for tea from the hot water dispenser, and get plasticware and napkins almost daily. So... yeah great store.', 
:user => nico_p, :store => sunshine_store 

sunshine_review_3 = Review.create! :content => 'Somethings are absurdly expensive others regularly priced. Snicker bars for example are like 75 cents. But a bag of chips like 5 bukcs.', 
:user => john_s, :store => sunshine_store

sunshine_review_4 = Review.create! :content => 'One of the few markets so the prices are ridiculous, but the line moves fast and they have a decent selection.'
:user => matt_n, :store => sunshine_store 


# seeding tags

puts 'Creating tags for Cups reviews'
Tag.create! :name => '#Sandwich', :review => cups_review_1.id
Tag.create! :name => '#Breakfast', :review => cups_review_2.id
Tag.create! :name => '#Lunch', :review => cups_review_2.id
Tag.create! :name => '#Pizza', :review => cups_review_2.id
Tag.create! :name => '#Burrito', :review => cups_review_2.id
Tag.create! :name => '#Bagel', :review => cups_review_3.id
Tag.create! :name => '#Coffee', :review => cups_review_4.id
Tag.create! :name => '#Sandwich', :review => cups_review_4.id

puts 'Creating tags for Goodys reviews'
Tag.create! :name => '#Burrito', :review => goodys_review_1.id
Tag.create! :name => '#Sandwich', :review => goodys_review_2.id
Tag.create! :name => '#Healthy', :review => goodys_review_2.id
Tag.create! :name => '#Expensive', :review => goodys_review_3.id
Tag.create! :name => '#Healthy', :review => goodys_review_3.id
Tag.create! :name => '#South-of-the-Border', :review => goodys_review_3.id
Tag.create! :name => '#Water-refill', :review => goodys_review_4.id
Tag.create! :name => '#Healthy', :review => goodys_review_4.id

Tag.create! :name => '#Chicken', :review => panda_review_1.id
Tag.create! :name => '#Asian', :review => panda_review_2.id
Tag.create! :name => '#Chicken', :review => panda_review_2.id
Tag.create! :name => '#Gross', :review => panda_review_3.id
Tag.create! :name => '#Gross', :review => panda_review_4.id
Tag.create! :name => '#Straight-to-the-bathroom', :review => panda_review_4.id

Tag.create! :name => '#Burger', :review => bk_review_1.id
Tag.create! :name => '#American', :review => bk_review_1.id
Tag.create! :name => '#Gross', :review => bk_review_2.id
Tag.create! :name => '#Expensive', :review => bk_review_3.id
Tag.create! :name => '#Inexpensive', :review => bk_review_3.id
Tag.create! :name => '#Chicken', :review => bk_review_3.id
Tag.create! :name => '#Fries', :review => bk_review_3.id
Tag.create! :name => '#Awesome', :review => bk_review_4.id

Tag.create! :name => '#Sandwich', :review => subway_review_1.id
Tag.create! :name => '#Stingy', :review => subway_review_1.id
Tag.create! :name => '#Sandwich', :review => subway_review_2.id
Tag.create! :name => '#Inexpensive', :review => subway_review_2.id
Tag.create! :name => '#Gross', :review => subway_review_3.id
Tag.create! :name => '#Stingy', :review => subway_review_4.id
Tag.create! :name => '#Small servings', :review => subway_review_4.id

Tag.create! :name => '#Indian', :review => bombay_review_1.id
Tag.create! :name => '#Gross', :review => bombay_review_2.id
Tag.create! :name => '#Indian', :review => bombay_review_2.id
Tag.create! :name => '#Gross', :review => bombay_review_3.id
Tag.create! :name => '#Expensive', :review => bombay_review_3.id
Tag.create! :name => '#Indian', :review => bombay_review_4.id

Tag.create! :name => '#Drinks', :review => sunshine_review_1.id
Tag.create! :name => '#Groceries', :review => sunshine_review_1.id
Tag.create! :name => '#Soup', :review => sunshine_review_1.id
Tag.create! :name => '#Snacks', :review => sunshine_review_1.id
Tag.create! :name => '#Free', :review => sunshine_review_2.id
Tag.create! :name => '#Expensive', :review => sunshine_review_1.id
Tag.create! :name => '#Inexpensive' :review => sunshine_review_1.id
Tag.create! :name => '#Expensive', :review => sunshine_review_1.id
Tag.create! :name => '#Convenient', :review => sunshine_review_1.id
