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

Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')