FactoryBot.define do
  factory :address do
    street { 'rua Manoel Dutra' }
    number { '595' }
    complement { 'apt. 87' }
    city { 'São Paulo' }
    state { 'GO' }
  end
end
