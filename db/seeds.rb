# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

center_point = { lat: 50.0515918, lng: 19.9357531 }
 
1.upto(1000) do |i|
  Tree.create!(
    location: Faker::Address.city,
    description: Faker::Lorem.sentence,
    longitude: center_point[:lng] + rand(-10.00..10.00),
    latitude: center_point[:lat] + rand(-10.00..10.00),
    price_per_night: rand(20..500)
    capacity: rand(2..73)
  )
end


