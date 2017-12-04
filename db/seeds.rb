# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'random_data'

 10.times do
  User.create(
    email: Faker::Internet.email,
    password: 'password'
   )
 end
 
 users = User.all

 # Create Wikis
 50.times do
 
   Wiki.create!(
     user: users.sample, 
     title:  Faker::Lorem.words(4),
     body:   Faker::Lorem.words(8)
   )
 end
 wikis = Wiki.all
 
 puts "#{Wiki.count} wikis created"
