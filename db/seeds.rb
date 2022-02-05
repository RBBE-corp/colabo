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
  
contributors = []
  (5..55).to_a.each do |i|
    contributors << User.create!(
    mission: Faker::Company.catch_phrase,
    password: "123456",
    email: "username#{i}@gmail.com",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    user_name: "username#{i}",
    org_name: "#{Faker::Company.name} #{Faker::Company.industry}" ,
    total_points: 0
  )
end
  
projects = []
finished = []
# Find a Foster Home For Pets
start = Faker::Time.between(from: DateTime.now + 2, to: DateTime.now + 7)
project = Project.create!(
  user: erika,
  project_name: "Find me a home - Pet Adoption Listing",
  description: "In need of IT experts who can create a pet listing for a local animal shelter.",
  location: "Meguro",
  start_date: start,
  end_date: Faker::Time.between(from: start, to: start + rand(7200..14400)),
  people_required: 3,
  reward_earned: "Free passs to 'Pet Parlour'",
  points_earned: 20
)
file = URI.open('https://cdn.pixabay.com/photo/2018/11/17/19/47/kennels-for-pets-3821861_960_720.jpg')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
projects << project


# Neighborhood Watch Group
start = Faker::Time.between(from: DateTime.now + 2, to: DateTime.now + 7)
project = Project.create!(
  user: erika,
  project_name: "Watchmen - Neighborhood Patrol",
  description: "We will hold a routine evening event to help students get home safely.
  The event will be supervised by the local police department.",
  location: "Ikebukuro",
  start_date: start,
  end_date: Faker::Time.between(from: start, to: start + rand(7200..14400)),
  people_required: 15,
  reward_earned: "Casio G-shock of your choice",
  points_earned: 5
)
file = URI.open('https://cdn.pixabay.com/photo/2016/11/14/04/10/boy-1822565_960_720.jpg')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
projects << project


# Park Cleaning
start = Faker::Time.between(from: DateTime.now + 2, to: DateTime.now + 7)
project = Project.create!(
  user: byron,
  project_name: "Yoyogi Park Run and Clean",
  description: "Join in on our monthly park cleaning event where you will get a chance to
  meet other runners and help the community by cleaning Yoyogi Park.",
  location: "Shibuya City, Tokyo",
  start_date: start,
  end_date: Faker::Time.between(from: start, to: start + rand(7200..14400)),
  people_required: 50,
  reward_earned: "Cleaners will recieve a original fanny pack and Addidas Gift Card (1,000 yen)",
  points_earned: 5
)
file = URI.open('https://media.istockphoto.com/photos/group-of-volunteers-with-garbage-bags-cleaning-park-picture-id1145183184?b=1&k=20&m=1145183184&s=170667a&w=0&h=3i_yhZjmIbMom70t13TY2Pv2BXmH_xC9rW3eyEASgH4=')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
projects << project


# Food Drive
start = Faker::Time.between(from: DateTime.now + 2, to: DateTime.now + 7)
project = Project.create!(
  user: reona,
  project_name: "Food Drive in Ueno Park",
  description: "Winter is the hardest time for the homeless, join in on a food drive this weekend.
  We will provide ingredients for cooking, but will need your help preparing them!",
  location: "Ueno-koen, Taito-ku, Tokyo",
  start_date: start,
  end_date: Faker::Time.between(from: start, to: start + rand(7200..14400)),
  people_required: 4,
  reward_earned: "QUO Book Card (500 yen)",
  points_earned: 20
)
file = URI.open('https://media.istockphoto.com/photos/donate-to-the-poor-homeless-still-seen-in-society-concept-of-charity-picture-id1082704324?b=1&k=20&m=1082704324&s=170667a&w=0&h=w8M9NYB6gk5FtHX83NoAZ2fkoGnL0EeRCJv0AHv_3-Y=')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
projects << project


# Tree Planting
project = Project.create!(
  user: babin,
  project_name: "Revive Ishinomaki - Family Tree Planting",
  description: "We will be hosting a one day event for families interested in joining the ongoing reforestation project
  in Ishinomaki City, Miyagi Prefecture. The goal is to plant 500 trees.",
  location: "Ishinomaki City, Miyagi Prefecture",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now - 0.5),
  end_date: Faker::Time.between(from: DateTime.now - 0.5, to: DateTime.now),
  people_required: 50,
  reward_earned: "A hotel room with lunch, dinner, and breakfast.",
  points_earned: 15
)
file = URI.open('https://images.unsplash.com/photo-1513086670993-297187d3a281?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHRyZWUlMjBwbGFudGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
finished << project

start = Faker::Time.between(from: DateTime.now + 2, to: DateTime.now + 7)
project = Project.create!(
  user: babin,
  project_name: "Revive Ishinomaki Part 2 - Family Tree Planting",
  description: "We are back again to host a one day event for families interested in joining the ongoing reforestation project
  in Ishinomaki City, Miyagi Prefecture. The goal is to plant 300 more trees.",
  location: "Ishinomaki City, Miyagi Prefecture",
  start_date: start,
  end_date: Faker::Time.between(from: start, to: start + rand(7200..14400)),
  people_required: 30,
  reward_earned: "A hotel room with lunch, dinner, and breakfast.",
  points_earned: 15
)
file = URI.open('https://images.unsplash.com/photo-1513086670993-297187d3a281?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fHRyZWUlMjBwbGFudGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
projects << project

project = Project.create!(
user: byron,
  project_name: "Find me a home - Child Adoption Listing",
  description: "In need of IT experts who can create a listing for a shelter for children in need.",
  location: "hokkaido",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now - 0.5),
  end_date: Faker::Time.between(from: DateTime.now - 0.5, to: DateTime.now),
  people_required: 10,
  reward_earned: "Free pass for Disney land.",
  points_earned: 20
)
file = URI.open('https://images.unsplash.com/photo-1503919545889-aef636e10ad4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Y2hpbGR8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
finished << project


# Neighborhood Watch Group
start = Faker::Time.between(from: DateTime.now + 2, to: DateTime.now + 7)
project = Project.create!(
  user: erika,
  project_name: "Talk Stronger",
  description: "We will hold a routine evening event to help people to develop social speaking skill.
  The event will be supervised by Byron, the renowed Social Speaker.",
  location: "Meguro",
  start_date: start,
  end_date: Faker::Time.between(from: start, to: start + rand(7200..14400)),
  people_required: 15,
  reward_earned: "'Better Speaker' book by Byron ",
  points_earned: 5
)
file = URI.open('https://cdn.pixabay.com/photo/2016/06/26/12/05/megaphone-1480342__340.jpg')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
projects << project


# Park Cleaning
start = Faker::Time.between(from: DateTime.now + 2, to: DateTime.now + 7)
project = Project.create!(
  user: byron,
  project_name: "Yoyogi Park Walkathon",
  description: "Join in on our monthly park walkaton event where you will get a chance to
  meet other walker and help the people develop better habit.",
  location: " Shibuya City, Tokyo",
  start_date: start,
  end_date: Faker::Time.between(from: start, to: start + rand(7200..14400)),
  people_required: 50,
  reward_earned: "Diet Plan from Professional Coach",
  points_earned: 5
)
file = URI.open('https://cdn.pixabay.com/photo/2021/08/14/18/01/people-6545894__340.jpg')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
projects << project


# Food Drive
project = Project.create!(
  user: reona,
  project_name: "Food Drive in Matsudo Park",
  description: "Winter is the hardest time for the homeless, join in on a food drive this weekend.
  We will provide ingredients for cooking, but will need your help preparing them!",
  location: "Matsudo city",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now - 0.5),
  end_date: Faker::Time.between(from: DateTime.now - 0.5, to: DateTime.now),
  people_required: 8,
  reward_earned: "QUO Book Card (500 yen)",
  points_earned: 20
)
file = URI.open('https://media.istockphoto.com/photos/donate-to-the-poor-homeless-still-seen-in-society-concept-of-charity-picture-id1082704324?b=1&k=20&m=1082704324&s=170667a&w=0&h=w8M9NYB6gk5FtHX83NoAZ2fkoGnL0EeRCJv0AHv_3-Y=')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
finished << project

# Tree Planting
project = Project.create!(
  user: babin,
  project_name: "Revive Yoshikawa - Family Tree Planting",
  description: "We will be hosting a one day event for families interested in joining the ongoing reforestation project
  in Yoshikawa City, Saitama Prefecture. The goal is to plant 500 trees.",
  location: "Yoshikawa City",
  start_date: start,
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now - 0.5),
  end_date: Faker::Time.between(from: DateTime.now - 0.5, to: DateTime.now),
  people_required: 50,
  reward_earned: "A hotel room with lunch, dinner, and breakfast.",
  points_earned: 15
)
file = URI.open('https://www.aeon.info/ef/common/images/content/greening_activities/domestic/kimitsu_chiba_2021.png')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
finished << project

project = Project.create!(
user: byron,
  project_name: "Tree Planting",
  description: "We will be hosting a one day event for families interested in joining the ongoing reforestation project
  in Koshigaya City, Saitama Prefecture. The goal is to plant 500 trees.",
  location: "Koshigaya city, Japan",
  start_date: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now - 0.5),
  end_date: Faker::Time.between(from: DateTime.now - 0.5, to: DateTime.now),
  people_required: 10,
  reward_earned: "Free pass to my Seminar.",
  points_earned: 15
)
file = URI.open('https://images.unsplash.com/photo-1549744504-a3cefc5c3bd0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHRyZWUlMjBwbGFudGluZ3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60')
project.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
puts project.photo.attached?
project.save!
finished << project

puts "here"
finished.each do |project|
  all_contributors = [byron, babin, erika, reona] - [project.user] + contributors
  (0...project.people_required).to_a.each do |i|
    Contribution.create!(
      user: all_contributors[i],
      project: project,
      status: :accepted,
      start_date: project.start_date,
      end_date: project.end_date
    )
  end 
end

projects.each do |project|
  all_contributors = [byron, babin, erika, reona] - [project.user] + contributors
  (0..rand(1...project.people_required)).to_a.each do |i|
    Contribution.create!(
      user: all_contributors[i],
      project: project,
      status: [:accepted, :pending, :denied].sample,
      start_date: project.start_date,
      end_date: project.end_date
    )
  end
end

puts "Database Seeded!"
