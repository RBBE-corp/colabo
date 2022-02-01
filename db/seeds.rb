# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning up database"
puts "......"
puts "......"
Contribution.destroy_all
Project.destroy_all
User.destroy_all
puts "Database is clean"

puts "Seeding the database"
puts "......"


babin = User.create!(
  mission: "There's more we can do to help others and the community!",
  password: "123456",
  email: "username1@gmail.com",
  first_name: "Babin",
  last_name: "Bahora",
  user_name: "username1",
  org_name: "Bahora Holdings, LLC",
  total_points: 9999
)

erika = User.create!(
  mission: "Let's make the world a better place!",
  password: "123456",
  email: "username2@gmail.com",
  first_name: "Erika",
  last_name: "Kawashima",
  user_name: "username2",
  org_name: "Erika Digital Arts & Designs, LLC",
  total_points: 100
)

byron = User.create!(
  mission: "Going beyond CSR and giving back to our community!",
  password: "123456",
  email: "username3@gmail.com",
  first_name: "Byron",
  last_name: "Lee",
  user_name: "username3",
  org_name: "Adidas",
  total_points: 65
)

contributor = User.create!(
  mission: "Saving people's live one small step at a time.",
  password: "123456",
  email: "username5@gmail.com",
  first_name: "Harold",
  last_name: "Goodman",
  user_name: "username5",
  org_name: "The Do Good Company",
  total_points: 9999
)

reona = User.create!(
  mission: "Reach out to everyone in the community through community projects.",
  password: "123456",
  email: "username4@gmail.com",
  first_name: "Reona",
  last_name: "Kasuya",
  user_name: "username4",
  org_name: "Tokyo Municipal Office",
  total_points: 0
)

users = [babin, erika, byron, reona, contributor]

projects = []

# Find a Foster Home For Pets
pets = Project.create!(
  user: erika,
  project_name: "Find me a home - Pet Adoption Listing",
  description: "In need of IT experts who can create a pet listing for a local animal shelter.",
  location: "Meguro",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  people_required: 3,
  reward_earned: "5 Public gym tickets (worth 2,500 yen)",
  points_earned: 20
)

# Neighborhood Watch Group
watch = Project.create!(
  user: erika,
  project_name: "Watchmen - Neighborhood Patrol",
  description: "We will hold a routine evening event to help students get home safely.
  The event will be supervised by the local police department.",
  location: "Ikebukuro",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  people_required: 15,
  reward_earned: "Casio G-shock of your choice",
  points_earned: 5
)

# Park Cleaning
yoyogi = Project.create!(
  user: byron,
  project_name: "Yoyogi Park Run and Clean",
  description: "Join in on our monthly park cleaning event where you will get a chance to
  meet other runners and help the community by cleaning Yoyogi Park.",
  location: "Yoyogikamizonochō, Shibuya City, Tokyo",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  people_required: 50,
  reward_earned: "Cleaners will recieve a original fanny pack and Addidas Gift Card (1,000 yen)",
  points_earned: 5
)

# Food Drive
food = Project.create!(
  user: reona,
  project_name: "Food Drive in Ueno Park",
  description: "Winter is the hardest time for the homeless, join in on a food drive this weekend.
  We will provide ingredients for cooking, but will need your help preparing them!",
  location: "Ueno-koen, Taito-ku, Tokyo",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  people_required: 4,
  reward_earned: "QUO Book Card (500 yen)",
  points_earned: 20
)

# Tree Planting
revive = Project.create!(
  user: babin,
  project_name: "Revive Ishinomaki - Family Tree Planting",
  description: "We will be hosting a one day event for families interested in joining the ongoing reforestation project
  in Ishinomaki City, Miyagi Prefecture. The goal is to plant 500 trees.",
  location: "Ishinomaki City, Miyagi Prefecture",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
  people_required: 50,
  reward_earned: "A hotel room with lunch, dinner, and breakfast.",
  points_earned: 15
)

projects = [pets, watch, revive, food]

# Completed Project - Food Drive
# 4.times do
#   Contribution.create!(
#     user: users.sample,
#     project: food,
#     status: :accepted,
#     start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#     end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
#   )
# end

4.times do
  Contribution.create!(
    user: users.sample,
    project: projects.sample,
    status: :accepted,
    start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
    end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now)
  )
end

puts "Database Seeded!"
# 5.times do
#   Contribution.create!(
#     user: users.sample,
#     project: projects.sample,
#     status: rand(0..2)
#     # start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#     # end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#   )
# end

# We need contributions and projects with completed status
# The user account and contribution should be the same
# Change the project titles and address so it works with the geoplocator
# Add a seed for the new text field for user bios.

# Faker
# 20.times do
# projects << Project.create!(
#   user: users.sample,
#   project_name: Faker::Marketing.buzzwords + rand(1..1000).to_s,
#   description: Faker::Games::WorldOfWarcraft.quote,
#   location: Faker::Address.street_address,
#   start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#   end_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now),
#   people_required: rand(20..50),
#   reward_earned: rand(1..5),
#   points_earned: rand(1..15)
# )
