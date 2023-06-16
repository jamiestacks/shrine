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

puts 'Creating user db'

main_user = User.create(first_name: "Frank", family_name: "Connery", email: "frank123456@hotmail.com", password: "123456")
main_user.photo.attach(io: File.open("./app/assets/images/main_user.jpg"), filename: "main_user.jpg")
main_user.save

user1 = User.create(
  first_name: "Olivia",
  family_name: "Morana",
  email: "mynameis1@hotmail.com",
  password: "123456"
)

user1.photo.attach(io: File.open("./app/assets/images/user1.jpg"), filename: "user1.jpg")
user1.save

user2 = User.create(
  first_name: "Abigail",
  family_name: "Connery",
  email: "mynameis2@hotmail.com",
  password: "123456"
)

user2.photo.attach(io: File.open("./app/assets/images/user2.jpg"), filename: "user2.jpg")
user2.save

user3 = User.create(
  first_name: "Emma",
  family_name: "Connery",
  email: "mynameis3@hotmail.com",
  password: "123456"
)

user3.photo.attach(io: File.open("./app/assets/images/user3.jpg"), filename: "user3.jpg")
user3.save

user4 = User.create(
  first_name: "Alex",
  family_name: "Connery",
  email: "mynameis4@hotmail.com",
  password: "123456"
)

user4.photo.attach(io: File.open("./app/assets/images/user4.jpg"), filename: "user4.jpg")
user4.save

user5 = User.create(
  first_name: "Jack",
  family_name: "Connery",
  email: "mynameis5@hotmail.com",
  password: "123456"
)

user5.photo.attach(io: File.open("./app/assets/images/user5.jpg"), filename: "user5.jpg")
user5.save

user6 = User.create(
  first_name: "Michael",
  family_name: "Connery",
  email: "michael@connery.com",
  password: "123456"
)

user6.photo.attach(io: File.open("./app/assets/images/user6.jpg"), filename: "user6.jpg")
user6.save

puts "created #{User.count} users"
puts 'User data base created'

#shrine seeding

puts 'Creating shrines'

# Create new instance of Shrines

bio = "Sean Connery, the legendary James Bond, defined suave sophistication on the silver screen. With his irresistible charm and iconic voice, he remains an enduring symbol of cinematic excellence and the epitome of a true Scottish legend."

main_shrine = Shrine.new(first_name: "Sean", family_name: "Connery", dob: "1930-08-25", dod: "2020-10-31", biography: bio, user_id: main_user.id)
# Open the image file
file = File.open("./app/assets/images/johnprofile.jpg")
main_shrine.photo.attach(io: file, filename: "johnprofile.jpg")
main_shrine.save!

second_bio = "Christopher Lee was one of the defining characters of cinema for over 60 years. His iconic roles as Bram Stoker's Dracula, George Lucas' Count Dooku, and Tolkien's Saruman helped to cement his legacy in the arts throughout the generations."

second_shrine = Shrine.new(first_name: "Christopher", family_name: "Lee", dob: "1922-05-27", dod: "2015-06-07", biography: second_bio, user_id: user1.id)
# Open the image file
file = File.open("./app/assets/images/christopher_lee.jpg")
second_shrine.photo.attach(io: file, filename: "christopher_lee.jpg")
second_shrine.save!

puts "Created Shrines"

#creating Shrine_Users

puts "Creating ShrineUsers"

ShrineUser.create(
  user_id: 2,
  shrine_id: 1,
  status: "accept",
  relationship: "Granddaughter"
)

ShrineUser.create(
  user_id: 3,
  shrine_id: 1,
  status: "accept",
  relationship: "Daughter"
)

ShrineUser.create(
  user_id: 4,
  shrine_id: 1,
  status: "accept",
  relationship: "Niece"
)

ShrineUser.create(
  user_id: 5,
  shrine_id: 1,
  status: "accept",
  relationship: "Grandson"
)

ShrineUser.create(
  user_id: 6,
  shrine_id: 1,
  status: "accept",
  relationship: "Son"
)

puts "Created ShrineUsers"

#creating chapters

puts "Creating chapters"

chapter_1 = Chapter.new(
  title: "The day Sean was born",
  date_start: "1930-08-25",
  date_end: "1930-08-25",
  shrine_id: main_shrine.id,
  description: "Thomas Connery was born at the Royal Maternity Hospital in Edinburgh, Scotland, on 25 August 1930; he was named after his paternal grandfather. He was brought up at No. 176 Fountainbridge, a block which has since been demolished.His mother, Euphemia McBain 'Effie' McLean, was a cleaning woman."
)
chapter_1.photo.attach(io: File.open("./app/assets/images/johnmom.jpeg"), filename: "johnmom.jpeg")
chapter_1.save!

chapter_2 = Chapter.new(
  title: "Sean's child hood",
  date_start: "1935-04-29",
  date_end: "1945-05-06",
  shrine_id: main_shrine.id,
  description: "Although he was small in primary school, he grew rapidly around the age of 12, reaching his full adult height of 6 ft 2 in (188 cm) at 18. Connery was known during his teen years as 'Big Tam', and he said that he lost his virginity to an adult woman in an ATS uniform at the age of 14. He had an Irish childhood friend named Séamus; when the two were together, those who knew them both called Connery by his middle name Sean, emphasising the alliteration of the two names. Since then Connery preferred to use his middle name."
)
chapter_2.photo.attach(io: File.open("./app/assets/images/seandofg.jpg"), filename: "seandofg.jpg")
chapter_2.save!

chapter_3 = Chapter.new(
  title: "Sean's days in the navy",
  date_start: "1946-10-25",
  date_end: "1947-07-23",
  shrine_id: main_shrine.id,
  description: "In 1946, at the age of 16, Connery joined the Royal Navy, during which time he acquired two tattoos. Connery's official website says'unlike many tattoos, his were not frivolous - his tattoos reflect two of his lifelong commitments: his family and Scotland. ... One tattoo is a tribute to his parents and reads 'Mum and Dad', and the other is self-explanatory, 'Scotland Forever''"
)
chapter_3.photo.attach(io: File.open("./app/assets/images/johnnavy.jpg"), filename: "johnnavy.jpg")
chapter_3.save!

chapter_4 = Chapter.new(
  title: "Career changes",
  date_start: "1948-12-14",
  date_end: "1950-07-19",
  shrine_id: main_shrine.id,
  description: "Afterwards, he returned to the co-op and worked as a lorry driver, a lifeguard at Portobello swimming baths, a labourer, an artist's model for the Edinburgh College of Art, and after a suggestion by former Mr. Scotland Archie Brennan, as a coffin polisher, among other jobs. The modelling earned him 15 shillings an hour."
)
chapter_4.photo.attach(io: File.open("./app/assets/images/johnyoung.jpeg"), filename: "johnyoung.jpeg")
chapter_4.save!

chapter_5 = Chapter.new(
  title: "Sean joined the theatre",
  date_start: "1953-03-01",
  date_end: "1957-06-26",
  shrine_id: main_shrine.id,
  description: "Seeking to supplement his income, Connery helped out backstage at the King's Theatre in late 1951. Connery landed a small part as one of the Seabees chorus boys. By the time the production reached Edinburgh, he had been given the part of Marine Cpl. Hamilton Steeves and was understudying two of the juvenile leads, and his salary was raised from £12 to £14–10s a week."
)
chapter_5.photo.attach(io: File.open("./app/assets/images/seanconnerytheatre.jpg"), filename: "seanconnerytheatre.jpg")
chapter_5.save!

chapter_6 = Chapter.new(
  title: "Wedding with Diane",
  date_start: "1962-03-11",
  date_end: "1974-03-11",
  shrine_id: main_shrine.id,
  description: "Connery was married to actress Diane Cilento from 1962 to 1974, though they separated in 1971. They had a son, actor Jason Joseph."
)
chapter_6.photo.attach(io: File.open("./app/assets/images/johnfam.jpeg"), filename: "johnfam.jpeg")
chapter_6.save!

chapter_7 = Chapter.new(
  title: "Sean's break- through as James Bond",
  date_start: "1962-10-05",
  date_end: "1967-03-11",
  shrine_id: main_shrine.id,
  description: "Connery's breakthrough came in the role of British secret agent James Bond. He was reluctant to commit to a film series, but understood that if the films succeeded, his career would greatly benefit. Between 1962 and 1967, Connery played 007 in Dr. No, From Russia with Love, Goldfinger, Thunderball, and You Only Live Twice, the first five Bond films produced by Eon Productions."
)
chapter_7.photo.attach(io: File.open("./app/assets/images/johnbond2.jpeg"), filename: "johnbond2.jpeg")
chapter_7.save!

chapter_8 = Chapter.new(
  title: "Wedding with Micheline",
  date_start: "1975-01-12",
  date_end: "2020-10-31",
  shrine_id: main_shrine.id,
  description: "Connery was married to French-Moroccan painter Micheline Roquebrune (born 4 April 1929) from 1975 until his death. The marriage survived a well-documented affair Connery had in the late 1980s with the singer and songwriter Lynsey de Paul, which she later regretted due to his views concerning domestic violence."
)
chapter_8.photo.attach(io: File.open("./app/assets/images/johnwife2.png"), filename: "johnwife2.png")
chapter_8.save!

chapter_9 = Chapter.new(
  title: "Sean's retire- ment",
  date_start: "2006-04-11",
  date_end: "2010-03-11",
  shrine_id: main_shrine.id,
  description: "When Connery received the American Film Institute's Lifetime Achievement Award on 8 June 2006, he confirmed his retirement from acting. Connery's disillusionment with the 'idiots now making films in Hollywood'  was cited as a reason for his decision to retire.[110] On 7 June 2007, he denied rumours that he would appear in the fourth Indiana Jones film, saying 'retirement is just too much damned fun'. In 2012, Connery briefly came out of retirement to voice the title character in the Scottish animated film Sir Billi. Connery served as executive producer for an expanded 80-minute version."
)
chapter_9.photo.attach(io: File.open("./app/assets/images/johngranddaughter.jpeg"), filename: "johngranddaughter.jpeg")
chapter_9.save!

chapter_10 = Chapter.new(
  title: "Sean's last days",
  date_start: "2020-10-31",
  date_end: "2020-10-31",
  shrine_id: main_shrine.id,
  description: "Sean's dementia worsened in his last years, and he passed away in his sleep on 31 October 2020, aged 90, at his home in the Lyford Cay community of Nassau in the Bahamas."
)
chapter_10.photo.attach(io: File.open("./app/assets/images/johnyoung2.jpg"), filename: "johnyoung2.jpg")
chapter_10.save!

# creating stories
puts "Seeding stories for Sean's time in the navy"

story_1 = Story.new(
  title: "My best mate",
  body: "I met Sean at the Navy, we became best friends and did everything together",
  chapter_id: chapter_3.id,
  user_id: User.all.sample.id
)
story_1.photos.attach(io: File.open("./app/assets/images/seanconnery_navy_2.jpg"), filename: "seanconnery_navy_2.jpg")
story_1.photos.attach(io: File.open("./app/assets/images/seanconnery_navy_5.jpg"), filename: "seanconnery_navy_5.jpg")
story_1.photos.attach(io: File.open("./app/assets/images/seanconnery_navy_6.jpg"), filename: "seanconnery_navy_6.jpg")
story_1.save!

story_2 = Story.new(
  title: "I want to follow Grandad's Navy career",
  body: "Grandad really inspired me to join the Navy. I'm not a great actor like him but I want to be a great sailor like him. He told me a great story of how he pranked the captain and got demoted to cleaning duties",
  chapter_id: chapter_3.id,
  user_id: User.all.sample.id
)
story_2.photos.attach(io: File.open("./app/assets/images/seanconnery_navy_1.jpg"), filename: "seanconnery_navy_1.jpg")
story_2.photos.attach(io: File.open("./app/assets/images/seanconnery_navy_3.jpg"), filename: "seanconnery_navy_3.jpg")
story_2.save!

story_3 = Story.new(
  title: "He visited me in the Bahamas",
  body: "Sean stayed in the Bahamas during his time with the Navy. He loved the country so much that he brought my house. I took care of the house when he left but he returned frequently on his holidays.",
  chapter_id: chapter_3.id,
  user_id: User.all.sample.id
)
story_3.photos.attach(io: File.open("./app/assets/images/seanconnery_navy_4.jpg"), filename: "seanconnery_navy_4.jpg")
story_3.save!

story_4 = Story.new(
  title: "I remember his time in the Navy",
  body: "Sean Connery's naval service influenced his iconic charm. The daring sailor navigated storms with courage, captivating his fellow crewmates with wit and storytelling. His time at sea laid the foundation for his future success, as he transformed into the legendary James Bond, forever embodying the spirit of adventure and suave sophistication.",
  chapter_id: chapter_3.id,
  user_id: User.all.sample.id
)
story_4.save!

puts "SEEDING HAS BEEN COMPLETED"
