require 'faker'

instruments = [
'brwne0fehawjr7ihbni6',
'e1l174x1xwwyj6aeprxk',
'sayzq8hkiya1qrxt0cex',
'ynjhaj1anzjpegfc7vir',
'cuqogphlew1sadffqv37',
'zarviq2rv2lq3xxlzkor',
'iwsgelka0iurvyhsullu'
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
