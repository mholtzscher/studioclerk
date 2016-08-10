Fabricator(:lesson) do
  duration { Faker::Number.between(30, 90) }
  date_time { Faker::Date.between(1.year.ago, Date.today) }
  notes { Faker::Lorem.sentence }
end