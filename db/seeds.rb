require 'faker'

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
      photos: Faker::LoremPixel.image(size: "400x400", category: 'nightlife'),
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
