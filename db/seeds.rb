require 'faker'

Rental.destroy_all
Instrument.destroy_all
User.destroy_all

p "init"
10.times do
  user = User.create(email: Faker::Internet.email, password: "123456", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Nation.capital_city)
  user.save!
end

50.times do
  instrument = Instrument.create(name: Faker::Music.instrument, description: Faker::Lorem.sentence, address: Faker::Address.full_address, price: Faker::Number.decimal(l_digits: 2), available: true, user: User.all.sample)
  instrument.save!
end

20.times do
  date = Faker::Date.forward(days: 23)
  rent = Rental.create(user: User.all.sample, instrument: Instrument.all.sample, start_date: date, end_date: date.next_day(5))
  rent.save!
end
p "end"

p "There is #{User.all.count} users"
p "There is #{Instrument.all.count} instruments"
p "There is #{Rental.all.count} rentals"
