# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"

puts "creating users"

3.times do
  User.create(
    email: Faker::Internet.email,
    password: "123456",
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name ,
    phone_number: Faker::PhoneNumber.cell_phone,
    bio: Faker::Quote.yoda
  )
end

puts "#{User.count} users created"
puts "creating spaces"

User.all.each do |user|
  2.times do
    Space.create(
      user: user,
      name: Faker::Cannabis.strain,
      address: Faker::Address.street_address,
      description: Faker::Lorem.paragraph(sentence_count: 4),
      price: rand(50..100)
    )
  end
end

puts "#{Space.count} spaces created"
puts "creating bookings"

10.times do
  booking = Booking.new(
    price: rand(100..200),
    start_date: Faker::Date.between(from: 2.days.from_now, to: 5.days.from_now),
    end_date: Faker::Date.between(from: 6.days.from_now, to: 10.days.from_now),
  )
  booking.space = Space.all.sample
  booking.user = User.all.sample
  booking.save
end

puts "#{Booking.count} bookings created"
puts "Your seeds are now ready for action"
 