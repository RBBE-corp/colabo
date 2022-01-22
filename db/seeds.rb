# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning up database"
Contribution.destroy_all
Project.destroy_all
User.destroy_all

puts "Database is clean"

puts "Seeding the database"

users = []

users << User.create!(
  password: "123456",
  email: "username1@gmail.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  user_name: "username1",
  org_name: Faker::Company.name,
  total_points: 0
)

users << User.create!(
  password: "123456",
  email: "username2@gmail.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  user_name: "username2",
  org_name: Faker::Company.name,
  total_points: 0
)

users << User.create!(
  password: "123456",
  email: "username3@gmail.com",
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  user_name: "username3",
  org_name: Faker::Company.name,
  total_points: 0
)

projects = []
20.times do
projects << Project.create!(
    user: users.sample,
    project_name: Faker::Marketing.buzzwords,
    description: Faker::Games::WorldOfWarcraft.quote,
    location: Faker::Address.street_address,
    start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    reward_earned: rand(1..5),
    points_earned: rand(1..15)
  )
end


15.times do
  Contribution.create!(
    user: users.sample,
    project: projects.sample,
    status: rand(0..2),
    start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  )
end
