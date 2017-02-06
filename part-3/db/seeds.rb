
10.times do
  user_info = {
    username: Faker::Superhero.name,
    email: Faker::Internet.email,
    password: "password"
  }
  User.create(user_info)
end

30.times do
  potluck_info = {
    name: Faker::Beer.style,
    location: Faker::Pokemon.location,
    starts_at: Faker::Time.forward(23),
    host_id: rand(1..10)
  }
  Potluck.create(potluck_info)
end

80.times do
  rsvp_info = {
    dish: Faker::Food.ingredient,
    potluck_id: rand(1..30),
    attendee_id: rand(1..10)
  }
  Rsvp.create(rsvp_info)
end
