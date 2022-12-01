# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "faker"
require "open-uri"

Booking.destroy_all
Space.destroy_all
User.destroy_all

puts "creating users"


User.create(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.first_name ,
  last_name: Faker::Name.last_name ,
  phone_number: Faker::PhoneNumber.cell_phone,
  bio: Faker::Quote.yoda
)

User.create(
  email: Faker::Internet.email,
  password: "123456",
  first_name: Faker::Name.first_name ,
  last_name: Faker::Name.last_name ,
  phone_number: Faker::PhoneNumber.cell_phone,
  bio: Faker::Quote.yoda
)


puts "#{User.count} users created"
puts "creating spaces"

# User.all.each do |user|
    file = URI.open("https://www.mydeskhub.com/wp-content/uploads/2017/06/Mob-H-27-scaled.jpg")
    spaceone = Space.new(
      user: User.all.sample,
      name: "Makers of Barcelona",
      address: "Calle Bailen 11, Bajos 08010 Barcelona",
      description: "A pioneer in Barcelona coworking for creatives, makers and 3D printing",
      price: rand(10..30)
    )
    spaceone.image.attach(io: file, filename: 'spaceone.jpg', content_type: 'image/jpg')
    spaceone.save!


    file = URI.open("https://s3-eu-west-1.amazonaws.com/spaceson/uploads/room_image/image/19091/slider_IMG_1327-min.jpg")
    spacetwo = Space.create(
      user: User.all.sample,
      name: "Sowo Coworking",
      address: "Consell de Cent, 413-415 4º2ª, 08009 Barcelona",
      description: "Sowo Coworking offers both desks and private offices in a space of over 650 square meters. Amenities include high-speed internet, a phone box, abundant natural light, meeting rooms, rest areas and coffee and tea. Regular events are created to help you meet new people, create synergies and unwind. Members can access the space 24/7 and reception is open during business hours so you can receive packages and attend to clients prior to a meeting.",
      price: rand(10..30)
    )
    spacetwo.image.attach(io: file, filename: 'spacetwo.jpg', content_type: 'image/jpg')
    spacetwo.save!

    file = URI.open("https://mir-s3-cdn-cf.behance.net/project_modules/fs/c8657356569517.5f3d2e44c0ea2.jpg")
    spacethree = Space.create(
      user: User.all.sample,
      name: "BASE Coworking",
      address: " Gran Via de les Corts Catalanes 690, Eixample, 08010, Barcelona",
      description: "After 8 years in Barcelona, Noumena team have finally inaugurated a new space hosting 3d printers, robots, textiles and creative minds! Noumena opens BASE, a new multidisciplinary coworking space for young talents and entrepreneurs.",
      price: rand(10..30)
    )
    spacethree.image.attach(io: file, filename: 'spacethree.jpg', content_type: 'image/jpg')
    spacethree.save!

    file = URI.open("https://i1.wp.com/aticco.com/wp-content/uploads/2020/06/coworking-barcelona.jpg")
    spacefour = Space.create(
      user: User.all.sample,
      name: "Aticco Coworking",
      address: "Ronda Sant Pere, 52, atico",
      description: "The Aticco community lives in an amazing 1000 m2 penthouse in the center of Barcelona with amazing views of the city and tons of sunlight. It features a 300 m2 terrace to lounge, work or even contribute to our vegetable garden. Aticco offers 2 meeting rooms, a huge kitchen, a chillout area, a shower room, private offices and coworking tables.",
      price: rand(10..30)

    )
    spacefour.image.attach(io: file, filename: 'spacefour.jpg', content_type: 'image/jpg')
    spacefour.save!

    file = URI.open("https://felisacowork.com/wp-content/uploads/2017/09/pgina-galera-imgenes-para-clicar-2-felisa-cowork-e1516362511251.jpg")
    spacefive = Space.create(
      user: User.all.sample,
      name: "Felisa CoWork",
      address: "C/ Rosselló 295 Bajos 08037 Barcelona",
      description: "Felisa CoWork is a welcoming, charming and professional coworking space in the center of Barcelona, where you can boost your productivity by receiving coaching, mentoring and individual skills development plans as part of the services offered. Organic fruit, back massage and a brainstorming breakfast in creative surroundings, among like-minded people are among the attractions of the Eixample based space.",
      price: rand(10..30)
    )
    spacefive.image.attach(io: file, filename: 'spacefive.jpg', content_type: 'image/jpg')
    spacefive.save!

    file = URI.open("https://lh3.googleusercontent.com/ognRrCCQq1AcSPsiQNfFRHzHrlMDM-3mJKcG58ddXS0B3RP7p_t_KU5QZwWqYBB4UE3xWao2W5b8pj_YsfvOCpNxLf7-hZwypB21I850u5pGH451SQtdqDlbVPL_yE6YjfFXm46h")
    spacesix = Space.create(
      user: User.all.sample,
      name: "Cloudworks",
      address: "Gran Via de les Corts Catalanes, 613, 08007 Barcelona",
      description: "Find your perfect coworking space and connect with a growing community of fellow professionals in a unique setting. Cloudworks is your one-stop coworking solution, offering customized services for freelancers, start-ups and other businesses.",
      price: rand(10..30)

    )
    spacesix.image.attach(io: file, filename: 'spacesix.jpg', content_type: 'image/jpg')
    spacesix.save!

    file = URI.open("https://barcelonanavigator.com/wp-content/uploads/2019/08/Cowork-Rambla-Catalunya.jpg")
    spaceseven = Space.create(
      user: User.all.sample,
      name: "Cowork Rambla Catalunya",
      address: "Carrer Corsega, num. 284, 1 Pis, 08008 Barcelona",
      description: "A pioneer in Barcelona coworking for creatives, makers and 3D printing",
      price: rand(10..30)
    )
    spaceseven.image.attach(io: file, filename: 'spaceseven.jpg', content_type: 'image/jpg')
    spaceseven.save!

    file = URI.open("https://barcelonanavigator.com/wp-content/uploads/2018/01/Studio52.jpg")
    spaceeight = Space.create(
      user: User.all.sample,
      name: "STUDIO 52 BCN",
      address: "Carrer de la Ciutat de Granada, 52, 08005 Barcelona",
      description: "Studio 52 offers a pleasant, bright and inspiring coworking space where you can carry out your projects. An imaginative, optimistic and productive work environment. Ideal for photography professionals.",
      price: rand(10..30)
    )
    spaceeight.image.attach(io: file, filename: 'spaceeight.jpg', content_type: 'image/jpg')
    spaceeight.save!

    file = URI.open("https://coworker.imgix.net/photos/netherlands/amsterdam/tsh-collab-amsterdam-west/7-1537944550.jpg?w=1200&h=0&q=90&auto=format,compress&fit=crop&mark=/template/img/wm_icon.png&markscale=5&markalign=center,middle")
    spacenine = Space.create(
      user: User.all.sample,
      name: "TSH Coworking",
      address: "C. Cristobal de Moura 49, 08019, Barcelona",
      description: "TSH Barcelona Poblenou is a new hybrid hotel with a large coworking space. It has 293 hotel rooms, a coworking space with over 700 work stations including desks and private offices, a terrace and pool, high speed wifi, 24/7 access, mailboxes, meeting rooms, a gym, and a restaurant.",
      price: rand(10..30)
    )
    spacenine.image.attach(io: file, filename: 'spacenine.jpg', content_type: 'image/jpg')
    spacenine.save!

    file = URI.open("https://coworkingspain.es/sites/default/files/coworking/img8205.png")
    spaceten = Space.create(
      user: User.all.sample,
      name: "Depot Lab",
      address: "Carrer del Bruc, 149, 08037 Barcelona",
      description: "Depot Lab is a new coworking space in Barcelona for creative, innovative and open minded entrepreneurs and companies. It is a 2nd home for already a lot of (inter-)national companies where they can establish, grow, collaborate, learn and network.A pioneer in Barcelona coworking for creatives, makers and 3D printing",
      price: rand(10..30)
    )
    spaceten.image.attach(io: file, filename: 'spaceten.jpg', content_type: 'image/jpg')
    spaceten.save
# end

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
