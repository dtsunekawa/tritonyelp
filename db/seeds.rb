# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Mongoid.purge!

<<<<<<< HEAD
admin = User.create(name: 'John', email: 'testuser@ucsd.edu', lname: 'Doe', role: 'admin', password: 'testing123')
store = Store.create(name: 'John\'s Pizza', user: admin)
=======
puts 'PURGING DATABASE'
Mongoid.purge!


	admin = User.create(name: 'John', email: 'testuser@ucsd.edu', lname: 'Doe', role: 'admin', password: 'testing123')
	store = Store.create(name: 'John\'s Pizza', user: admin)
>>>>>>> 213a41c61157ff681f686d5c1e1595ca955e3a21


###########################
# How to seed database
# run these commands
# bundle exec rake db:drop
# bundle exec rake db:create_indexes
# bundle exec rake db:seed
###########################

# seeding users
puts 'SETTING UP DEFAULT USER LOGIN'
u_cust = User.create! :name => 'John', :lname => 'Doe', :role => 'customer', :email => 'johndoe@gmail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_cust.name
u_cust2 = User.create! :name => 'Tim', :lname => 'Liang', :role => 'customer', :email => 'timLiang@gmail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_cust2.name
u_cust3 = User.create! :name => 'Cindy', :lname => 'Smith', :role => 'customer', :email => 'cSmith@gmail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_cust3.name
u_merchant = User.create! :name => 'Kevin', :lname => 'Huang', :role => 'merchant', :email => 'kevinhuang@gmail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_merchant.name
u_merchant2 = User.create! :name => 'Liam', :lname => 'Jordon', :role => 'merchant', :email => 'lJordon@gmail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_merchant2.name
u_merchant3 = User.create! :name => 'Claire', :lname => 'Alex', :role => 'merchant', :email => 'ClaireAlex@gmail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_merchant3.name
u_merchant4 = User.create! :name => 'UCSD', :lname => 'Merchant', :role => 'merchant', :email => 'ucsd@ucsd.edu', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_merchant4.name
u_admin = User.create! :name => 'Melissa', :lname => 'Johnson', :role => 'admin', :email => 'melJohnson@ymail.com', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << u_admin.name


# seeding stores
puts 'SETTING UP DEFAULT STORES'
s_goodies = Store.create! :name => 'Goodies', :avg_rating => 9.5, :avg_price => 7.49, :x_coord => 48.89, :y_coord => 67.93
s_goodies.user = u_merchant._id
s_goodies.save!
puts 'New store created: ' << s_goodies.name
s_panda = Store.create! :name => 'Panda Express', :avg_rating => 6.5, :avg_price => 6.49, :x_coord => 48.89, :y_coord => 67.93
s_panda.user = u_merchant._id
s_panda.save!
puts 'New store created: ' << s_panda.name
s_burger_king = Store.create! :name => 'Burger_king', :avg_rating => 5.5, :avg_price => 5.29, :x_coord => 48.89, :y_coord => 67.93
s_burger_king.user = u_merchant2._id
s_burger_king.save!
puts 'New store created: ' << s_burger_king.name
s_subway = Store.create! :name => 'Subway', :avg_rating => 8.5, :avg_price => 5.21, :x_coord => 48.89, :y_coord => 67.93
s_subway.user = u_merchant2._id
s_subway.save!
puts 'New store created: ' << s_subway.name
s_bombay = Store.create! :name => 'Bombay Coast', :avg_rating => 6.5, :avg_price => 6.79, :x_coord => 48.89, :y_coord => 67.93
s_bombay.user = u_merchant3._id
s_bombay.save!
puts 'New store created: ' << s_bombay.name
s_sunshine = Store.create! :name => 'Sun Shine Market', :avg_rating => 9.5, :avg_price => 5.79, :x_coord => 48.89, :y_coord => 67.93
s_sunshine.user = u_merchant4._id
s_sunshine.save!
puts 'New store created: ' << s_sunshine.name
s_bookStore = Store.create! :name => 'UCSD Book Store', :avg_rating => 7.5, :avg_price => 98.99, :x_coord => 48.89, :y_coord => 67.93
s_bookStore.user = u_merchant4._id
s_bookStore.save!
puts 'New store created: ' << s_bookStore.name
s_Geisel = Store.create! :name => 'Geisel', :avg_rating => 9.8, :avg_price => 0.0, :x_coord => 48.89, :y_coord => 67.93
s_Geisel.user = u_merchant4._id
s_Geisel.save! The Burritos are so good and cheap The Burritos are so good and cheap
puts 'New store created: ' << s_Geisel.name
s_cse_lab = Store.create! :name => 'Cse Lab', :avg_rating => 9.9, :avg_price => 0.0, :x_coord => 48.89, :y_coord => 67.93
s_cse_lab.user = u_merchant4._id
s_cse_lab.save!
puts 'New store created: ' << s_cse_lab.name

# seeding reviews
puts 'SETTING UP DEFAULT REVIEWS'
r_user_goodies = Review.create! :content => 'The Burritos are so good and cheap'
r_user_goodies.user = u_cust._id
r_user_goodies.store = s_goodies._id
r_user_goodies.save!
puts 'New review created: ' << r_user_goodies.content
r_user_panda = Review.create! :content => 'The food are so greasy'
r_user_panda.user = u_cust._id
r_user_panda.store = s_panda._id
r_user_panda.save!
puts 'New review created: ' << r_user_panda.content
r_user_burger_king = Review.create! :content => 'Love the sweet potato fries'
r_user_burger_king.user = u_cust2._id
r_user_burger_king.store = s_burger_king._id
r_user_burger_king.save!
puts 'New review created: ' << r_user_burger_king.content
r_user_sunshine = Review.create! :content => 'So convience'
r_user_sunshine.user = u_cust3._id
r_user_sunshine.store = s_sunshine._id
r_user_sunshine.save!
puts 'New review created: ' << r_user_sunshine.content

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