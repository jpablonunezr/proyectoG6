# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Level.destroy_all
Subject.destroy_all

User.create(email:'a@a', password:'123456')
User.create(email:'b@b', password:'123456')


Level.create(name:'Pre-Kínder')
Level.create(name:'Kínder')
Level.create(name:'1 Básico')
Level.create(name:'2 Básico')
Level.create(name:'3 Básico')
Level.create(name:'4 Básico')
Level.create(name:'5 Básico')
Level.create(name:'6 Básico')
Level.create(name:'7 Básico')
Level.create(name:'8 Básico')
Level.create(name:'I Medio')
Level.create(name:'II Medio')
Level.create(name:'III Medio')
Level.create(name:'IV Medio')

Subject.create(name:'Lenguaje')
Subject.create(name:'Matemática')
Subject.create(name:'Historia')
Subject.create(name:'Ciencias')
Subject.create(name:'Biología')
Subject.create(name:'Física')
Subject.create(name:'Química')
Subject.create(name:'Psicología')
Subject.create(name:'Ingles')
Subject.create(name:'Religión')
Subject.create(name:'Lenguaje')