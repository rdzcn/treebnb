# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# center_point = { lat: 50.0515918, lng: 19.9357531 }
p "destroying all ----- users __ trees ___ and bookings____ in database"
Booking.destroy_all
Tree.destroy_all
User.destroy_all


p "creating a user"

user_custom = User.create(email: "arda@gmail.com", password: "123456")
cities = ["Rudi-Dutschke-Straße, Berlin", "Fritz-Schloß-Park, Berlin", "Mauerpark, Berlin"]
# cities = %w(Berlin Paris Havana Oslo London Shanghai Moscow Toronto York Madrit Amsterdam Prague)

p "creating 100 new trees"





1.upto(20) do |i|
	Tree.create!(
		address: cities.sample,
		description: Faker::Commerce.department,
    # longitude: center_point[:lng] + rand(-10.00..10.00),
    # latitude: center_point[:lat] + rand(-10.00..10.00),
    price_per_night: rand(20..500),
    capacity: rand(2..73),
    user: user_custom
    )

end
 p "finished"

