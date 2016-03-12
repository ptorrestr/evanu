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

# Locations
## country
Country.create!(name: "Chile")
## state
s1 = State.create!(name: "Tarapacá", country: Country.find(1))
s2 = State.create!(name: "Antofagasta", country: Country.find(1))
s3 = State.create!(name: "Atacama", country: Country.find(1))
s4 = State.create!(name: "Coquimbo", country: Country.find(1))
s5 = State.create!(name: "Valparaíso", country: Country.find(1))
s6 = State.create!(name: "Región del Libertador Gral. Bernardo O'Higgins", country: Country.find(1))
s7 = State.create!(name: "Región del Maule", country: Country.find(1))
s8 = State.create!(name: "Región del Biobío", country: Country.find(1))
s9 = State.create!(name: "Región de la Araucanía", country: Country.find(1))
s10 = State.create!(name: "Región de Los Lagos", country: Country.find(1))
s11 = State.create!(name: "Región Aisén del Gral. Carlos Ibáñez del Campo", country: Country.find(1))
s12 = State.create!(name: "Región de Magallanes y de la Antártica Chilena", country: Country.find(1))
s13 = State.create!(name: "Región Metropolitana de Santiago", country: Country.find(1))
s14 = State.create!(name: "Región de Los Ríos", country: Country.find(1))
s15 = State.create!(name: "Arica y Parinacota", country: Country.find(1))
## county
c11 = County.create!(name: "Iquique", state: s1)
c12 = County.create!(name: "Tamarugal", state: s1)
c21 = County.create!(name: "Antofagasta", state: s2)
c22 = County.create!(name: "El Loa", state: s2)
c23 = County.create!(name: "Tocopilla", state: s2)
c31 = County.create!(name: "Copiapó", state: s3)
c32 = County.create!(name: "Chañaral", state: s3)
c33 = County.create!(name: "Huasco", state: s3)
c41 = County.create!(name: "Elqui", state: s4)
c42 = County.create!(name: "Choapa", state: s4)
c43 = County.create!(name: "Limarí", state: s4)
c51 = County.create!(name: "Valparaíso", state: s5)
c52 = County.create!(name: "Isla de Pascua", state: s5)
c53 = County.create!(name: "Los Andes", state: s5)
c54 = County.create!(name: "Petorca", state: s5)
c55 = County.create!(name: "Quillota", state: s5)
c56 = County.create!(name: "San Antonio", state: s5)
c57 = County.create!(name: "San Felipe de Aconcagua", state: s5)
c58 = County.create!(name: "Marga Marga", state: s5)
c61 = County.create!(name: "Cachapoal", state: s6)
c62 = County.create!(name: "Cardenal Caro", state: s6)
c63 = County.create!(name: "Colchagua", state: s6)
c71 = County.create!(name: "Talca", state: s7)
c72 = County.create!(name: "Cauquenes", state: s7)
c73 = County.create!(name: "Curicó", state: s7)
c74 = County.create!(name: "Linares", state: s7)
c81 = County.create!(name: "Concepción", state: s8)
c82 = County.create!(name: "Arauco", state: s8)
c83 = County.create!(name: "Biobío", state: s8)
c84 = County.create!(name: "Ñuble", state: s8)
c91 = County.create!(name: "Cautín", state: s9)
c92 = County.create!(name: "Malleco", state: s9)
c101 = County.create!(name: "Llanquihue", state: s10)
c102 = County.create!(name: "Chiloé", state: s10)
c103 = County.create!(name: "Osorno", state: s10)
c104 = County.create!(name: "Palena", state: s10)
c111 = County.create!(name: "Coihaique", state: s11)
c112 = County.create!(name: "Aisén", state: s11)
c113 = County.create!(name: "Capitán Prat", state: s11)
c114 = County.create!(name: "General Carrera", state: s11)
c121 = County.create!(name: "Magallanes", state: s12)
c122 = County.create!(name: "Antártica Chilena", state: s12)
c123 = County.create!(name: "Tierra del Fuego", state: s12)
c124 = County.create!(name: "Última Esperanza", state: s12)
c131 = County.create!(name: "Santiago", state: s13)
c132 = County.create!(name: "Cordillera", state: s13)
c133 = County.create!(name: "Chacabuco", state: s13)
c134 = County.create!(name: "Maipo", state: s13)
c135 = County.create!(name: "Melipilla", state: s13)
c136 = County.create!(name: "Talagante", state: s13)
c141 = County.create!(name: "Valdivia", state: s14)
c142 = County.create!(name: "Ranco", state: s14)
c151 = County.create!(name: "Arica", state: s15)
c152 = County.create!(name: "Parinacota", state: s15)
