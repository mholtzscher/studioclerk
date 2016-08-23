Fabricator(:student) do
  lessons(count: 52)
  credits(count: 30)
  name { Faker::Name.name }
  phone { Faker::PhoneNumber.phone_number }
  parent_phone { Faker::PhoneNumber.phone_number }
  notes { Faker::Lorem.sentence }
  balance { Faker::Number.between(-100, 100) }
  rate { Faker::Number.between(10, 40) }
  email { Faker::Internet.email }
  parents_email { Faker::Internet.email }
  user_id {1}
end