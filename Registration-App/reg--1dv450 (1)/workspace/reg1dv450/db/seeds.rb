# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


users = User.create([{ id:0,name: 'Admin', email: "admin@admin.com", password:"0000" },
        {name: 'sven', email: "sven@sven.com", password:"1234" }])

a = Application.create(name: "My Cool App", key:"12345678")
User.find(1).applications << a