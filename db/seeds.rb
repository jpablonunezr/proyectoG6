# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

Subject.destroy_all
Level.destroy_all
User.destroy_all

l = Level.create!(name: 'No asignado')
Level.create!(name:'Pre-Kínder')
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


s = Subject.create!(name: 'No asignado')
Subject.create!(name:'Lenguaje')
Subject.create!(name:'Matemática')
Subject.create!(name:'Historia')
Subject.create!(name:'Ciencias')
Subject.create!(name:'Biología')
Subject.create!(name:'Física')
Subject.create!(name:'Química')
Subject.create!(name:'Psicología')
Subject.create!(name:'Ingles')
Subject.create!(name:'Religión')


u1 = User.create!(email:'alejandra@gmail.com', password:'123456', first_name:'Alejandra', last_name:'Díaz', subject_id: s.id, level_id: l.id)
u2 = User.create!(email:'pablo@gmail.com', password:'123456', first_name:'Pablo', last_name:'Nuñez', subject_id: s.id, level_id: l.id)

5.times do |i|
	m = Material.create!(title:"Proyecto #{i}",
    description:'Lorem ipsum dolor sit amet.',
    subject: s,
    level: l,
    public_level: 0)
    m.user_materials.build(user_id: u1.id, role: "owner").save
    m.user_materials.build(user_id: u2.id, role: "owner").save
end

5.times do |i|
	m = Material.create!(title:"Proyecto #{i+5}",
    description:'Lorem ipsum dolor sit amet.',
    subject: s,
    level: l,
    public_level: 0)
    m.user_materials.build(user_id: u1.id, role: "collaborator").save
    m.user_materials.build(user_id: u2.id, role: "collaborator").save
end

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')