# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

User.destroy_all
Level.destroy_all
Subject.destroy_all

User.create!(email:'alejandra@gmail.com', password:'123456', first_name:'alejandra', last_name:'Diaz')
User.create!(email:'pablo@gmail.com', password:'123456', first_name:'Pablo', last_name:'Nuñez')

l = Level.create!(name:'Pre-Kínder')
Level.create!(name:'Kínder')
Level.create!(name:'1 Básico')
Level.create!(name:'2 Básico')
Level.create!(name:'3 Básico')
Level.create!(name:'4 Básico')
Level.create!(name:'5 Básico')
Level.create!(name:'6 Básico')
Level.create!(name:'7 Básico')
Level.create!(name:'8 Básico')
Level.create!(name:'I Medio')
Level.create!(name:'II Medio')
Level.create!(name:'III Medio')
Level.create!(name:'IV Medio')

s = Subject.create!(name:'Lenguaje')
Subject.create!(name:'Matemática')
Subject.create!(name:'Historia')
Subject.create!(name:'Ciencias')
Subject.create!(name:'Biología')
Subject.create!(name:'Física')
Subject.create!(name:'Química')
Subject.create!(name:'Psicología')
Subject.create!(name:'Ingles')
Subject.create!(name:'Religión')

11.times do |i|
	Material.create!(title:"Proyecto #{i}",
    description:'Lorem ipsum dolor sit amet.',
    subject: s,
    level: l
  )
end
