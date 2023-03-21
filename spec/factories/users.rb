FactoryBot.define do
  factory :user do
    email { 'testuser@email.com' }
    password { '123123' }
    username { 'testuser' }
    full_name { 'Test User' }
    profile { 'Nulla aliquip eiusmod ex veniam cupidatat velit reprehenderit culpa.' }
    document { '95361945030' }
  end
end
