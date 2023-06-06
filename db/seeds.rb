require "open-uri"

# puts 'Cleaning users data base'
# User.destroy_all
# puts 'Cleaning shrines data base'
# Shrine.destroy_all

first_names = [
  "Liam", "Olivia", "Noah", "Emma", "Oliver", "Ava", "Elijah", "Charlotte", "William", "Sophia",
  "James", "Benjamin", "Isabella", "Lucas", "Mia", "Henry", "Evelyn", "Alexander", "Harper",
  "Michael", "Abigail", "Daniel", "Emily", "Matthew", "Elizabeth", "Sofia", "Joseph", "Avery", "Samuel", "Scarlett",
  "John", "Zoe", "Owen", "Hannah", "Jack", "Nora", "Luke", "Lily", "Max", "Jamie", "Hasna", "Eduardo"
]

puts 'Creating user db'
count = 1
10.times do
  user = User.new(
    name: first_names.sample,
    email: "mynameis#{count}@hotmail.com",
    password: "123456"
  )
  user.save
  count += 1
  puts "created #{User.count} users"
end
puts 'User data base created'

#shrine seeding

puts 'Creating shrine'

# Create new instance of Shrine
main_shrine = Shrine.new(name: "John Smith", DOB: "1937-03-11", DOD: "2023-06-15")

# Open the image file
File.open("/Users/max/code/shrine/shrine/app/assets/images/johnprofile.jpeg") do |file|
  main_shrine.photo = file
end
main_shrine.save!
