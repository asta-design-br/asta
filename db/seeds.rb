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

puts 'destroying every Event'
Event.destroy_all

puts 'destroying every Bid'
Bid.destroy_all

puts 'creating roles...'
%w[designer producer].each do |role|
  Role.create!(
    name: role
  )
end

puts 'creating users...'
designer = User.create!(
  email: 'designer@test.com',
  password: '123456',
  full_name: 'Testador Designer',
  username: 'testador_designer',
  profile: 'Mussum Ipsum, cacilds vidis litro abertis. Copo furadis é disculpa de bebadis, arcu quam euismod magna.Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo!Mé faiz elementum girarzis, nisi eros vermeio.Mais vale um bebadis conhecidiss, que um alcoolatra anonimis.',
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

puts 'assigning roles to users...'
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

puts 'creating addresses...'
Address.create!(
  street: 'Rua SB-36 qd. 49 lt. 05',
  number: 's/n',
  neighborhood: 'Portal do Sol 1',
  city: 'Goiânia',
  state: 'GO',
  asta_addressable: designer
)

Address.create!(
  street: 'Rua Celeste Santi',
  number: '68',
  neighborhood: 'Ahú',
  city: 'Curitiba',
  state: 'PR',
  asta_addressable: producer
)

puts 'creating phone numbers...'
Phone.create!(
  country_code: '+55',
  number: '62984279962',
  phonable: designer
)

Phone.create!(
  country_code: '+55',
  number: '(48)35214439',
  phonable: producer
)

puts 'creating event...'
Event.create!(
  user: producer_designer,
  title: 'Meu primeiro freela',
  description: 'Criar a arte visual da Babilonia Feira hype de Ipanema',
  start_time: DateTime.new(2023, 5, 1, 10, 30, 0),
  end_time: DateTime.new(2023, 10, 1, 10, 30, 0)
)

puts 'creating event...'
Event.create!(
  user: producer,
  title: 'Inteligência ARTE-ficial',
  description: 'Mix de arte humana com robô - A criatividade em foco no mundo moderno',
  start_time: DateTime.new(2023, 7, 1, 10, 30, 0),
  end_time: DateTime.new(2023, 10, 1, 10, 30, 0)
)

puts 'creating bid...'
Bid.create!(
  user: designer,
  auction: 'Teste 1'
)

puts 'creating bid...'
Bid.create!(
  user: producer,
  auction: 'Teste 2'
)

puts 'Fim'
