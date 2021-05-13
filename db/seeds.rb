# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([{name: "Gipsz Jakab", email: "gipsz@jakab.com"},{name: "Sóska Jóska", email: "soska@spenot.hu"}])
posts = Post.create([{petname: "Lóci", age: 3, species: "cirmos cica", description: "nagyon szereti a tejet", user_id: users.first.id},
             {petname: "Vince", age: 3, species: "kakas", description: "túrót zabál", user_id: users.last.id},
             {petname: "Jani", age: 3, species: "egér", description: "odavan az eperért", user_id: users.last.id}])

puts "Seed succesful!"