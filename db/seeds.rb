# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

# Subject.destroy_all
# Level.destroy_all
 User.destroy_all

@level =
  ['No asignado', 'Pre-Kínder', 'Kínder', '1 Básico', '2 Básico', '3 Básico', '4 Básico', '5 Básico', '6 Básico', '7 Básico', '8 Básico', 'I Medio', 'II Medio', 'III Medio', 'IV Medio']

@subject =
  ['No asignado', 'Lenguaje', 'Matemática', 'Historia', 'Ciencias', 'Biología', 'Física', 'Química', 'Psicología', 'Ingles', 'Religión']

@first_name =
  ['Alejandra', 'Pablo', 'Juan', 'Pedro', 'Pablo', 'Teresa', 'Sandra', 'Marisol', 'Marcelo', 'Sergio', 'Jorge', 'Javiera']

@last_name =
  ['Diaz', 'Nunez', 'Romero', 'Andrade', 'Soto', 'Galaz', 'Bravo', 'Pino', 'Carrasco', 'Lara', 'Jeria', 'Osorio' ]

@level.each do |level|
  Level.create!(name: level)
end

@subject.each do |subject|
  Subject.create!(name: subject)
end

12.times do |i|
  u = User.create(first_name: "#{@first_name[i]}", last_name: "#{@last_name[i]}", password:'123456', email: "#{@first_name[i]}.#{@last_name[i]}@gmail.com", level_id: rand(1..15), subject_id: rand(1..11))
  2.times do |a|
    m = Material.create!(title:"Proyecto #{a}", description:'Lorem ipsum dolor sit amet.', level_id: rand(1..15), subject_id: rand(1..11), public_level: rand(0..1))
    m.user_materials.build(user_id: u.id, role: "owner").save
  end
end

12.times do |c|
  UserMaterial.create!(role: 'collaborator', material_id: rand(1..24), user_id: rand(1..12))
end

User.find(1).photo = "http://www.misimagenesde.com/wp-content/uploads/2013/07/fotos-de-perfil.jpg"
User.find(2).photo = "http://cdn2.estamosrodando.com/biografias/9/13/brad-pitt-189841.jpg"
User.find(3).photo = "https://pbs.twimg.com/profile_images/563366754294849537/OkXDTD-Y.jpeg"
User.find(4).photo = "https://pbs.twimg.com/profile_images/646429957921611780/drKA9WeA.jpg"
User.find(5).photo = "https://pbs.twimg.com/profile_images/765489284417744896/MdKj_4F7.jpg"
User.find(6).photo = "http://www.canalrcn.com/exclusivas/sites/default/files/teresa10.jpg"
User.find(7).photo = "http://www.hola.com/imagenes/cine/2015082980696/sandra-bullock-novio-bryan-randall/0-332-799/sandra1-t.jpg"
User.find(8).photo = "https://pbs.twimg.com/profile_images/541212831442423809/XFd9WNjl.jpeg"
User.find(9).photo = "https://media.licdn.com/mpr/mpr/shrinknp_200_200/p/7/005/056/083/220c1b2.jpg"
User.find(10).photo = "http://web.uam.es/departamentos/ciencias/quimica/spline/people/sergio.jpg"
User.find(11).photo = "https://images-na.ssl-images-amazon.com/images/M/MV5BMjE1MTIwNTczN15BMl5BanBnXkFtZTgwMDUzMjQ5MTE@._V1_UY317_CR57,0,214,317_AL_.jpg"
User.find(12).photo = "http://www.carey.cl/wp-content/uploads/2012/09/Javiera-Sepulveda.jpg"

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# Level.create!(name: 'No asignado')
# Level.create!(name:'Pre-Kínder')
# Level.create!(name:'Kínder')
# Level.create!(name:'1 Básico')
# Level.create!(name:'2 Básico')
# Level.create!(name:'3 Básico')
# Level.create!(name:'4 Básico')
# Level.create!(name:'5 Básico')
# Level.create!(name:'6 Básico')
# Level.create!(name:'7 Básico')
# Level.create!(name:'8 Básico')
# Level.create!(name:'I Medio')
# Level.create!(name:'II Medio')
# Level.create!(name:'III Medio')
# Level.create!(name:'IV Medio')


# s = Subject.create!(name: 'No asignado')
# Subject.create!(name:'Lenguaje')
# Subject.create!(name:'Matemática')
# Subject.create!(name:'Historia')
# Subject.create!(name:'Ciencias')
# Subject.create!(name:'Biología')
# Subject.create!(name:'Física')
# Subject.create!(name:'Química')
# Subject.create!(name:'Psicología')
# Subject.create!(name:'Ingles')
# Subject.create!(name:'Religión')


# u1 = User.create!(email:'alejandra@gmail.com', password:'123456', first_name:'Alejandra', last_name:'Díaz', subject_id: s.id, level_id: l.id)
# u2 = User.create!(email:'pablo@gmail.com', password:'123456', first_name:'Pablo', last_name:'Nuñez', subject_id: s.id, level_id: l.id)

# 5.times do |i|
# 	m = Material.create!(title:"Proyecto #{i}",
#     description:'Lorem ipsum dolor sit amet.',
#     subject: s,
#     level: l,
#     public_level: 0)
#     m.user_materials.build(user_id: u1.id, role: "owner").save
#     m.user_materials.build(user_id: u2.id, role: "owner").save
# end

# 5.times do |i|
# 	m = Material.create!(title:"Proyecto #{i+5}",
#     description:'Lorem ipsum dolor sit amet.',
#     subject: s,
#     level: l,
#     public_level: 0)
#     m.user_materials.build(user_id: u1.id, role: "collaborator").save
#     m.user_materials.build(user_id: u2.id, role: "collaborator").save
# end

