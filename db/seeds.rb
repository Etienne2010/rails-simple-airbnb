# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
4.times do
  price = (rand() * 100.to_f).to_i
  guests = [1, 2, 3, 4, 5, 6]
  n_guests = guests.sample(1)[0]
  Flat.create(address: Faker::Address.full_address, name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    price_per_night: price, number_of_guests: n_guests)
end
