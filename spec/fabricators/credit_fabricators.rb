Fabricator(:credit) do
  ammount { Faker::Number.between(10, 100) }
  date_time { Faker::Date.between(1.year.ago, Date.today) }
  notes { Faker::Lorem.sentence }
end