# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{name:"Titus Kalunge"}, {name:"ERick MUtembei"}])
blocks = Block.create!([{name:"Macom Apartments", location:"KIdfarmamco", user:User.first}, {name:"Waringa Apartments", location:"KIdfarmamco", user:User.second}, {name:"Glory House Apartments", location:"KIdfarmamco", user:User.second}, {name:"Sironi Apartments", location:"KIdfarmamco", user:User.second}])
tenants = Tenant.create!([{name:"Titus Kalunge", email:"tenant@mail.com", deposit:180000}, {name:"Eric Mungwwana", email:"mungs@mail.com", deposit:180000}])
apartments = Apartment.create!([{name:"12", vacant:false, block: Block.first, rent:15000, tenant: Tenant.first}, {name:"6AB", vacant:true, block: Block.second, rent:15000}])
