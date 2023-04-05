# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'destroying every Role'
Role.destroy_all

puts 'destroying every User'
User.destroy_all

####

puts 'creating roles...'
%w[designer producer].each do |role|
  Role.create!(
    name: role
  )
end

####

puts 'creating users...'
designer = User.create!(
  email: 'designer@test.com',
  password: '123456',
  full_name: 'Testador Designer',
  username: 'testador_designer',
  profile: 'Mussum Ipsum, cacilds vidis litro abertis. Copo furadis é disculpa de bebadis, arcu quam euismod magna.
  Todo mundo vê os porris que eu tomo, mas ninguém vê os tombis que eu levo!
  Mé faiz elementum girarzis, nisi eros vermeio.
  Mais vale um bebadis conhecidiss, que um alcoolatra anonimis.',
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

####

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

####

puts 'creating addresses to users...'
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

Address.create!(
  street: 'Rua  Manoel Dutra',
  number: '595',
  neighborhood: 'Bela Vista',
  city: 'São Paulo',
  state: 'SP',
  asta_addressable: producer_designer
)

####

puts 'creating phone numbers to users...'
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

Phone.create!(
  country_code: '+55',
  number: '(11)84240330',
  phonable: producer_designer
)

####

puts 'creating events...'
event1 = Event.create!(
  user: designer,
  title: 'Meu primeiro freela',
  description: 'Criar a arte visual da Babilonia Feira hype de Ipanema',
  start_time: DateTime.new(2023, 5, 1, 10, 30, 0),
  end_time: DateTime.new(2023, 10, 1, 10, 30, 0)
)

event2 = Event.create!(
  user: producer_designer,
  title: 'Inteligência ARTE-ficial',
  description: 'Mix de arte humana com robô - A criatividade em foco no mundo moderno',
  start_time: DateTime.new(2023, 7, 1, 10, 30, 0),
  end_time: DateTime.new(2023, 10, 1, 10, 30, 0)
)

####

puts 'creating addresses to events...'
Address.create!(
  street: 'Av. 85',
  number: '584',
  neighborhood: 'Setor Marista',
  city: 'Goiânia',
  state: 'GO',
  asta_addressable: event1
)

Address.create!(
  street: 'Av. Paulista',
  number: '900',
  neighborhood: 'Bela Vista',
  city: 'São Paulo',
  state: 'SP',
  asta_addressable: event2
)

####

puts 'creating phone numbers to events...'
Phone.create!(
  country_code: '+55',
  number: '(11)984279999',
  phonable: event1
)

Phone.create!(
  country_code: '+55',
  number: '48996860333',
  phonable: event2
)

####

puts 'creating products...'
product1 = Product.create!(
  event: event1,
  name: 'Mussum Flyer',
  description: 'Mussum Ipsum, cacilds vidis litro abertis.Paisis, filhis, espiritis santis.
  Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.',
  product_format: 'printed',
  mm_height: 5,
  mm_width: 3,
  required_time: 15,
  category: 'flyer'
)

product2 = Product.create!(
  event: event2,
  name: 'Didi Digital Poster',
  description: 'Didi Ipsum, cacilds vidis litro abertis.Paisis, filhis, espiritis santis.
  Em pé sem cair, deitado sem dormir, sentado sem cochilar e fazendo pose.',
  product_format: 'digital',
  mm_height: 8,
  mm_width: 8,
  required_time: 10,
  category: 'poster'
)

product3 = Product.create!(
  event: event2,
  name: 'Didi Digital Video',
  description: 'Sed non ipsum felis.Sapien in monti palavris qui num significa nadis i pareci latim.Nullam volutpat risus nec leo commodo, ut interdum diam laoreet. Sed non consequat odio.',
  product_format: 'video',
  milliseconds_length: 90,
  required_time: 23,
  category: 'video'
)

####

puts 'creating auctions...'
auction1 = Auction.create!(
  product: product1,
  deadline: product1.event.start_time - 1.hour
)

auction2 = Auction.create!(
  product: product2,
  deadline: product2.event.start_time - 1.hour
)

auction3 = Auction.create!(
  product: product3,
  deadline: product3.event.start_time - 1.hour
)

####

puts 'creating bids...'
Bid.create!(
  user: producer_designer,
  auction: auction1
)

Bid.create!(
  user: producer_designer,
  auction: auction2
)

Bid.create!(
  user: designer,
  auction: auction3
)

puts 'Fim'
