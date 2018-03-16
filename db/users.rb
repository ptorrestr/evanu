r1 = Role.create!(name: "admin")
r2 = Role.create!(name: "nutritionist")
r3 = Role.create!(name: "default")

1.times do |n|
	name = Faker::Name.name
	email = "admin@example.com"
	password = "foobar"
	user = User.create!(name: name,
             email: email,
             password: password,
             password_confirmation: password,
             activated: true,
             activated_at: Time.zone.now,
             roles: [r1])
end

1.times do |n|
  name = Faker::Name.name
  email = "nutritionist-#{n+1}@example.com"
  password = "foobar"
  user = User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now,
               roles: [r2])
  10.times do |n|
    name = Faker::Company.name
    phone = Faker::PhoneNumber.phone_number
    Kindergarden.create!(name: name,
                         phone: phone,
                         user: user,
                         city: ci15202)
  end
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
               roles: [r3])
end

## Kindergarden Levels
lowmiddlelevel = Level.crate!(name: "Low middle level")
prekinder = Level.create!(name: "Prekinder")

## Kindergarden Food Categories
snack = Category.create!(name: "Snack")
dessert = Category.create!(name: "Dessert")
poultry = Category.create!(name: "Poultry")
beef = Category.create!(name: "Beef")
fish = Category.create!(name: "Fish")
other = Category.create!(name: "Other")
salad = Category.create!(name: "Salad")
mashed = Category.create!(name: "Mashed Vegetables")
