require "open-uri"

puts 'Cleaning users data base'
User.destroy_all
puts 'Cleaning shrines data base'
Shrine.destroy_all

first_names = [
  "Liam", "Olivia", "Noah", "Emma", "Oliver", "Ava", "Elijah", "Charlotte", "William", "Sophia",
  "James", "Benjamin", "Isabella", "Lucas", "Mia", "Henry", "Evelyn", "Alexander", "Harper",
  "Michael", "Abigail", "Daniel", "Emily", "Matthew", "Elizabeth", "Sofia", "Joseph", "Avery", "Samuel", "Scarlett",
  "John", "Zoe", "Owen", "Hannah", "Jack", "Nora", "Luke", "Lily", "Max", "Jamie", "Hasna", "Eduardo"
]

main_user = User.create(name: "Frank", email: "frank123456@hotmail.com", password: "123456")


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
main_shrine = Shrine.new(name: "John Smith", dob: "1937-03-11", dod: "2023-06-15", user: main_user)

# Open the image file
file = File.open("./app/assets/images/johnprofile.jpg")
main_shrine.photo.attach(io: file, filename: "johnprofile.jpg")
main_shrine.save!
