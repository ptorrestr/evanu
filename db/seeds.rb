# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.create!(name: "admin")
Role.create!(name: "nutritionist")
Role.create!(name: "default")

User.create!(name: "Example User",
	     email: "example@railstutorial.org",
	     password: "foobar",
             password_confirmation: "foobar",
	     activated: true,
             activated_at: Time.zone.now,
	     roles: [Role.find(1)])

99.times do |n|
  name = Faker::Name.name
  email = "nutritionist-#{n+1}@example.com"
  password = "password"
  User.create!(name: name,
	       email: email,
	       password: password,
               password_confirmation: password,
	       activated: true,
               activated_at: Time.zone.now,
	       roles: [Role.find(2)])
end

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorail.org"
  password = "password"
  User.create!(name: name,
	       email: email,
	       password: password,
	       password_confirmation: password,
	       activated: true,
	       activated_at: Time.zone.now,
               roles: [Role.find(3)])
end
