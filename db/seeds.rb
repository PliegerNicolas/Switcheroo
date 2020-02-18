require 'faker'

instruments = [
  ['./app/assets/images/instruments/bigtamtam.jpg', 'bigtamtam'],
  ['./app/assets/images/instruments/elecgratgrat.jpg', 'elecgratgrat'],
  ['./app/assets/images/instruments/gratgrat.jpg', 'gratgrat'],
  ['./app/assets/images/instruments/hollowgratgrat.jpg', 'hollowgratgrat'],
  ['./app/assets/images/instruments/shapshap.jpg', 'shapshap'],
  ['./app/assets/images/instruments/shapshap1.jpg', 'shapshap1'],
  ['./app/assets/images/instruments/tamtam.jpg', 'tamtam'],
  ['./app/assets/images/instruments/taptap.jpg', 'taptap']
]

puts 'Destroy Instruments'
Instrument.destroy_all if Rails.env.development?
puts 'Destroy Users'
User.destroy_all if Rails.env.development?

print 'Creating instrument'
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
