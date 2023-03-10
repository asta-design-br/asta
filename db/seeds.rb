# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "destroying every User"
User.destroy_all

puts "destroying every Role"
Role.destroy_all

puts "creating user..."
User.create(
  email: 'dev@test.com',
  password: '123456'
)

puts "creating roles..."
['designer', 'producer'].each do |role|
  Role.create!(
    name: role
  )
end
