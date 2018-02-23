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



