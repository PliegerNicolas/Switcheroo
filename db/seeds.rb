require 'faker'

instruments = [
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053443/ytgftaeb3x8sz3y3ndrz.jpg', 'inst-img1'],
  ['https://res.cloudinary.com/dhemw39dw/image/upload/v1582053438/efhzhos9rfr8m9g3jou1.jpg', 'inst-img2']
]

puts 'Destroy Instruments'
Instrument.destroy_all
puts 'Destroy Users'
User.destroy_all

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
