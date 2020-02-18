require 'faker'

instruments = [
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582051338/KgQ2tWoaFnjfzcKwra2sPrTP.jpg', 'inst-img1'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582051337/JMjxD4N2WpRLSLEBVQchA46H.jpg', 'inst-img2'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582051336/NBN8JgKtpMxmw4eTuA9BMMBH.jpg', 'inst-img3'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582051333/MAUZs1dXanp8Pz3XAW2o49s6.jpg', 'inst-img4'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582051329/gLZVq2EwpkWxuyUzccHNLMoZ.jpg', 'inst-img5'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582051197/VSrQUmF29PEkTcZygHBQCdgQ.jpg', 'inst-img6']
]

puts 'Destroyed Instruments'
Instrument.destroy_all
puts 'Destroyed Users'
User.destroy_all

print 'Creating instruments'
10.times do
  print '.'
  i = Instrument.create!(
    name: Faker::Music.instrument,
    price: Faker::Number.within(range: 30..180),
    description: Faker::Lorem.sentence,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    status: %w[available rented].sample,
    views: (1..100).to_a.sample,
    user: User.create!(
      email: Faker::Internet.email,
      password: '123456789',
      username: Faker::Internet.username
    )
  )
  image_path = instruments.sample
  file = URI.open(image_path[0])
  i.photos.attach(io: file, filename: image_path[1])
end

puts ''
puts 'Finished seeding!'
