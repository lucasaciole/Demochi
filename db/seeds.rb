# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin Account
User.find_or_create_by_email(
  name:                   "System Admin", 
  email:                  "test@admin.com.br", 
  password:               "administrator", 
  password_confirmation:  "administrator", 
  admin:                  true
)

# Categories
["Masculino","Feminino","Infantil"].each do |cat|
  Category.find_or_create_by_name(cat)
end

puts "Running seed rake."