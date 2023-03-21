# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts 'destroying every Address'
Address.destroy_all

puts 'destroying every Role'
Role.destroy_all

puts 'destroying every User'
User.destroy_all

puts 'creating user...'
user1 = User.create!(
  email: 'dev@test.com',
  password: '123456',
  full_name: 'Daniela Rios',
  username: 'dani_rioss',
  profile: 'Sou designer gráfica. Trabalho conforme a necessidade do cliente para obter os melhores resultados,
  com uma visão jovem, atualizada e sempre aberto às novidades do mercado.',
  document: '023729341-20'
)

puts 'creating roles...'
%w[designer producer].each do |role|
  Role.create!(
    name: role
  )
end

puts 'creating address...'
Address.create!(
  street: 'Rua SB-36 qd. 49 lt. 05',
  number: 's/n',
  neighborhood: 'Portal do Sol 1',
  city: 'Goiânia',
  state: 'GO',
  addressable: user1
)

puts 'Fim'
