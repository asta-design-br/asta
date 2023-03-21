# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying every User Roles'
UserRole.destroy_all

puts 'destroying every Address'
Address.destroy_all

puts 'destroying every Role'
Role.destroy_all

puts 'destroying every User'
User.destroy_all

puts 'creating roles...'
%w[designer producer].each do |role|
  Role.create!(
    name: role
  )
end

puts 'creating user...'
designer = User.create!(
  email: 'dev@test.com',
  password: '123456',
  full_name: 'Daniela Rios',
  username: 'dani_rioss',
  profile: 'Sou designer gráfica. Trabalho conforme a necessidade do cliente para obter os melhores resultados,
  com uma visão jovem, atualizada e sempre aberto às novidades do mercado.',
  document: '023729341-20'
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

puts 'creating address...'
Address.create!(
  street: 'Rua SB-36 qd. 49 lt. 05',
  number: 's/n',
  neighborhood: 'Portal do Sol 1',
  city: 'Goiânia',
  state: 'GO',
  addressable: designer
)

puts 'creating address...'
Address.create!(
  street: 'Rua Celeste Santi',
  number: '68',
  neighborhood: 'Ahú',
  city: 'Curitiba',
  state: 'PR',
  addressable: producer
)

puts 'Fim'
