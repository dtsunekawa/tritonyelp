# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

	admin = User.create(name: 'John', email: 'testuser@ucsd.edu', lname: 'Doe', role: 'admin', password: 'testing123')
	store = Store.create(name: 'John\'s Pizza', user: admin)
