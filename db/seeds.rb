require 'faker'

instruments = [
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053443/piano.jpg', 'piano.jpg'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053438/tamtam.jpg', 'tamtam.jpg'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053427/violin.jpg', 'violin.jpg'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053419/banjo.jpg', 'banjo.jpg'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053407/guitar-acoustic.jpg', 'guitar-acoustic.jpg'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053400/guitar-electric.jpg', 'guitar-electric.jpg'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053392/drum.jpg', 'drum.jpg']
]

puts 'Destroyed Instruments'
Instrument.destroy_all
puts 'Destroyed Users'
User.destroy_all

print 'Creating instruments'
10.times do
  print '.'
  new_instrument = Instrument.create!(
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
  new_instrument.photos.attach(io: file, filename: image_path[1].to_s)
end

puts ''
puts 'Finished seeding!'
