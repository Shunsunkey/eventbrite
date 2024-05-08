# db/seeds.rb

require 'faker'

# Seed for 5 users with @yopmail.com email addresses
5.times do
  user = User.create!(
    email: Faker::Internet.unique.email(domain: 'yopmail.com'),
    password: 'password', # Default password for simplicity, you can change this
    description: Faker::Lorem.sentence,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    age: Faker::Number.between(from: 18, to: 65)
  )
  
  # Create some events for each user
  3.times do
    user.events.create!(
      title: Faker::Lorem.words(number: 3).join(' '), # Generate a random title
      description: Faker::Lorem.paragraph, # Generate a random description
      start_date: Faker::Time.between(from: DateTime.now, to: DateTime.now + 30), # Generate a random start date within the next 30 days
      duration: rand(1..6), # Generate a random duration between 1 and 6 hours
      price: rand(5..100), # Generate a random price between 5 and 100 euros
      location: Faker::Address.full_address # Generate a random location
    )
  end
end

puts "Seed finished"
