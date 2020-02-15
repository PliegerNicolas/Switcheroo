require 'faker'

instruments = [
'photo-1542590894-af0cf34bc9bc.jpeg',
'photo-1460036521480-ff49c08c2781.jpeg',
'photo-1482443462550-d2c99314ab6a.jpeg',
'photo-1508081883599-a58656e0ac48.jpeg',
'photo-1514649923863-ceaf75b7ec00.jpeg',
'photo-1528303538427-209fc9098e73.jpeg',
'photo-1530917203633-106d4a1a0967.jpeg'
]

puts "Destroy Instruments"
Instrument.destroy_all if Rails.env.development?
puts "Destroy Users"
User.destroy_all if Rails.env.development?

print "Creating instrument"
10.times do
  print '.'
    i = Instrument.create!(
      name: Faker::Music.instrument,
      price: Faker::Number.within(range: 30..180),
      description: Faker::Lorem.sentence,
      latitude: Faker::Address.latitude,
      longitude: Faker::Address.longitude,
      photos: instruments.sample,
      status: %w(available rented).sample,
      views: (1..100).to_a.sample,
      user: User.create!(
        email: Faker::Internet.email,
        password: '123456789',
        username: Faker::Internet.username
      )
    )
end

puts ''
puts "Finished seeding!"
