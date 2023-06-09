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

main_user = User.create(first_name: "Frank", family_name: "Reynolds", email: "frank123456@hotmail.com", password: "123456")

puts 'Creating user db'
count = 1
10.times do
  user = User.new(
    first_name: first_names.sample,
    family_name: "Test",
    email: "mynameis#{count}@hotmail.com",
    password: "123456"
  )
  user.save
  puts "created #{User.count} users"
  count += 1
end
puts 'User data base created'

#shrine seeding

puts 'Creating shrine'

# Create new instance of Shrine

bio = "John loved being a test Shrine. It was his dream his whole life, and is honoured to be used in such a way by smart Le Wagon students."

main_shrine = Shrine.new(first_name: "John", family_name: "Smith", dob: "1937-03-11", dod: "2023-06-15", biography: bio, user_id: main_user.id)
# Open the image file
file = File.open("./app/assets/images/johnprofile.jpg")
main_shrine.photo.attach(io: file, filename: "johnprofile.jpg")
main_shrine.save!

#creating chapters for Johns b-day and d-day

puts "Creating chapters"

dob = Chapter.new(title: "John's first day", date_start: "1937-03-11", date_end: "1937-03-11", shrine_id: main_shrine.id)
#adding image to each chapter
dob_file = File.open("./app/assets/images/johnmom.jpeg")
dob.photo.attach(io: dob_file, filename: "johnmom.jpeg")
dob.save!

dod = Chapter.new(title: "John's last day", date_start: "2023-06-15", date_end: "2023-06-15", shrine_id: main_shrine.id)
#adding image to each chapter
dod_file = File.open("./app/assets/images/sean_connery_old.jpg")
dod.photo.attach(io: dod_file, filename: "sean_connery_old.jpg")
dod.save!
