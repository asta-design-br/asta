# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying every User Roles'
UserRole.destroy_all

puts 'destroying every User'
User.destroy_all

puts 'destroying every Role'
Role.destroy_all

puts 'creating roles...'
%w[designer producer].each do |role|
  Role.create!(
    name: role
  )
end

puts 'creating user...'
designer = User.create!(
  email: 'designer@test.com',
  password: '123456',
  username: 'designer',
  full_name: 'Testador Designer',
  profile: 'Teste teste teste teste teste teste teste teste teste teste teste'
)

producer = User.create!(
  email: 'producer@test.com',
  password: '123456',
  username: 'producer',
  full_name: 'Testador Producer',
  profile: 'Teste teste teste teste teste teste teste teste teste teste teste'
)

producer_designer = User.create!(
  email: 'producerdesigner@test.com',
  password: '123456',
  username: 'producerdesigner',
  full_name: 'Designer Producer',
  profile: 'Teste teste teste teste teste teste teste teste teste teste teste'
)

puts 'assigning roles to user...'
UserRole.create!(
  user: designer,
  role: Role.first
)

UserRole.create!(
  user: producer,
  role: Role.second
)

UserRole.create!(
  user: producer_designer,
  role: Role.first
)

UserRole.create!(
  user: producer_designer,
  role: Role.second
)
