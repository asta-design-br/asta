FactoryBot.define do
  factory :address do
    asta_addressable { build(:user)}
    street { 'rua Manoel Dutra' }
    number { '595' }
    complement { 'apt. 87' }
    neighborhood { 'Bela Vista'}
    city { 'São Paulo' }
    state { 'GO' }
  end
end
