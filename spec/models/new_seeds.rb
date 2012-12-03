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



# seeding stores
puts 'New store created: ' << s_goodies.name
puts 'New store created: ' << s_panda.name

puts 'New store created: ' << s_burger_king.name

puts 'New store created: ' << s_subway.name

puts 'New store created: ' << s_bombay.name


# seeding reviews
puts 'Creating reviews...'

Review.create! :content => 'Excellent burritos for a decent price. Just what I need before a tough mission!', 
:user => jack_b, :store => goodys_store, 
puts 'New review created.'

Review.create! :content => 'Decent sandwich but not worth the price! There\'s a water bottle filling station inside as well.', 
:user => john_s, :store => goodys_store, 
puts 'New review created.'

Review.create! :content => 'The bowls are pretty good if your\'e looking for something low in carbs, about the average price of any thing decent on campus.', 
:user => dan_t, :store => goodys_store, 
puts 'New review created.'

Review.create! :content => 'One of the only foods I can eat on campus without needing a bathroom within 10 meters so definiately worth 6 bucks.', 
:user => nico_p, :store => goodys_store, 
puts 'New review created.'

# seeding tags
puts 'SETTING UP DEFAULT TAGS'
tag = Tag.create! :name => '#Burrito'
tag.review = r_user_goodies._id
tag.save!
puts 'New tag created: ' << tag.name
tag2 = Tag.create! :name => '#Fries'
tag2.review = r_user_burger_king._id
tag2.save!
puts 'New tag created: ' << tag2.name
tag3 = Tag.create! :name => '#Chinese Food'
tag3.review = r_user_panda._id
tag3.save!
puts 'New tag created: ' << tag3.name
tag4 = Tag.create! :name => '#Market Place'
tag4.review = r_user_sunshine._id
tag4.save!
puts 'New tag created: ' << tag4.name
