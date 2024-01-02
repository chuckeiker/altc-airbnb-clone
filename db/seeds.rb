require "open-uri"

ApplicationRecord.transaction do 
  puts "Destroying tables..."
  Review.destroy_all
  Reservation.destroy_all
  Listing.destroy_all
  User.destroy_all
  
  
  


  puts "Resetting primary keys..."
  ApplicationRecord.connection.reset_pk_sequence!('reviews')
  ApplicationRecord.connection.reset_pk_sequence!('reservations')
  ApplicationRecord.connection.reset_pk_sequence!('listings')
  ApplicationRecord.connection.reset_pk_sequence!('users')
  
  
end

puts "Creating users..."

#1 demo
User.create!(
  email: 'demo@user.io', 
  password: '!StrongPassword232305',
  last_name: 'DemoLastName',
  first_name: 'DemoFirstName'
)

#2 wiz
User.create!(
  email: 'demo@user2.io', 
  password: '!StrongPassword232305',
  last_name: 'Grey',
  first_name: 'Axar'
)

#3 Atlanna
User.create!(
  email: 'demo@user3.io', 
  password: '!StrongPassword232305',
  last_name: 'Daanuth',
  first_name: 'Garng'
)

#4 Horror
User.create!(
  email: 'demo@user4.io', 
  password: '!StrongPassword232305',
  last_name: 'Myers',
  first_name: 'Michael'
)

#5 Hobbit
User.create!(
  email: 'demo@user5.io', 
  password: '!StrongPassword232305',
  last_name: 'Baggins',
  first_name: 'Frodo'
)

#6 Candy witch
User.create!(
  email: 'demo@user6.io', 
  password: '!StrongPassword232305',
  last_name: 'Yaga',
  first_name: 'Baba'
)

#7 Defualt sale
User.create!(
  email: 'demo@user7.io', 
  password: '!StrongPassword232305',
  last_name: 'Mays',
  first_name: 'Billy'
)






puts "Creating listings..."

#1
listing1 = Listing.create!(
  host_id: 4,
  address: '13 Main Street, New York, NY 13131',
  title: 'Cozy Cabin in the Woods',
  description: "Unplug, unwind, and let the wilderness be your guide. From creaking floorboards to flickering candlelight, every moment here is an opportunity to discover the unexpected. The 'Cozy Cabin in the Woods' invites you to trade the ordinary for the extraordinary. (Any movement or structural changes to the premises are completely normal and nothing to worry about.)",
  num_beds: 13,
  num_bedrooms: 13,
  number_bathrooms: 13,
  price: 13.13,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: false,
  latitude: 40.7128,
  longitude: -74.0060
)

listing1_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin2.jpg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CozyCabin/CozyCabin5.jpeg"
]

listing1_photo_urls.each_with_index do |url, index|
  listing1.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#2
listing2 = Listing.create!(
  host_id: 5,
  address: "789 Fantasy Street",
  title: "Hobbit Hole in the Shire",
  description: "Welcome to my cozy Hobbit Hole, nestled snugly into the earth with all the charm and comfort a hobbit could ever desire! Step through the round doorway, and you'll find yourself in a world of rustic elegance – from the earthy tones of the walls to the cozy nooks where you can enjoy a second breakfast or curl up with a good book. The sunlight filters through the lush, green roof, casting a warm, dappled glow on the handcrafted furnishings.",
  num_beds: 1,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 60.0,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 51.5074,
  longitude: -0.1278
)

listing2_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse1.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse2.png",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse4.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/HobbitHouse/hobbitHouse5.jpeg"
]

listing2_photo_urls.each_with_index do |url, index|
  listing2.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#3
listing3 = Listing.create!(
  host_id: 2,
  address: "101 Maple Lane, Miami, FL 33101",
  title: "Wizard's Cottage",
  description: "Behold this peculiar 'Witchy Cottage,' a maddening hodgepodge of mystical oddities and endless headaches. From the crooked, leaning walls that defy all logic to the stubborn creaks and groans that serve as the house's morning serenade, it's a nightmare wrapped in enchanted confusion. The self-refilling cauldron in the kitchen? More trouble than it's worth. And don't get me started on the talking portraits that offer unsolicited advice. I've had enough of this chaotic abode, and if you have any sense, you'll stay far, far away! So its 50% off atm",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 50.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 42.5232,
  longitude: -70.8862
)

listing3_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage3.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardCottage/WizardCottage5.jpeg"
]

listing3_photo_urls.each_with_index do |url, index|
  listing3.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end


#4
listing4 = Listing.create!(
  host_id: 6,
  address: "234 Pine Street, San Francisco, CA 94101",
  title: "Candy Cabin",
  description: "🍭 Step into the Enchanted Candy Cabin, a place with secrets woven by a mysterious and delightful host. Immerse yourself in rooms adorned with gingerbread, marshmallow-soft beds, and a fireplace with secrets of its own. The kitchen is a candy maker's paradise, and outside, a forest holds hidden wonders, with candy mushrooms and peppermint flowers. Your hosts, with a touch of enchantment, are ready to make your stay truly magical. Book now for a sweet escape! 🍬🌲🏡",
  num_beds: 2,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 1.55,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 47.8295,
  longitude: -123.6405
)

listing4_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin4.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin2.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/CandyCabin/CandyCabin3.jpeg"
]

listing4_photo_urls.each_with_index do |url, index|
  listing4.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#5
listing5 = Listing.create!(
  host_id: 3,
  address: "567 Cedar Drive, Austin, TX 78701",
  title: "Atlantis Underwater Palace",
  description: "🌊 Behold the Kingdom of Atlantis, a realm veiled beneath the ocean's embrace, sculpted by the wisdom of its illustrious monarch. As you descend into the depths, be captivated by the coral castles and seashell-adorned throne room. Within, luxuriate in chambers with beds fit for royalty and dining halls resplendent with ocean's bounty.",
  num_beds: 7568,
  num_bedrooms: 4237,
  number_bathrooms: 4354,
  price: 99999.99,
  has_ac: false,
  has_wifi: false,
  has_pets_allowed: false,
  has_washer_dryer: false,
  latitude: 25.7772,
  longitude: -80.1865
)

listing5_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis1.avif",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis5.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Atlantis/Atlantis4.jpeg"
]

listing5_photo_urls.each_with_index do |url, index|
  listing5.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

# #6
listing6 = Listing.create!(
  host_id: 7,
  address: "890 Birch Boulevard, Seattle, WA 98101",
  title: "Dragon's Den Retreat",
  description: "Imagine living in a mystical cave, nestled amidst rugged mountains, with the heart of a dragon. This extraordinary abode offers an unparalleled blend of ancient allure and modern comfort. The cavernous interior boasts spacious chambers adorned with iridescent crystals, where sunlight dances on stone walls. Your own dragon's lair, complete with a subterranean hot spring and a treasure trove of geological wonders, awaits.",
  num_beds: 3,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 190.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 40.0155,
  longitude: -105.2657
)

listing6_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen4.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/DragonDen/DragonDen5.jpg"
]

listing6_photo_urls.each_with_index do |url, index|
  listing6.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

# 7
listing7 = Listing.create!(
  host_id: 7,
  address: "1234 Willow Lane, Denver, CO 80201",
  title: "Enchanted Hillside Castle",
  description: "Introducing the 'Majestic Relic Castle' - it's the epitome of timeless charm! Sure, it's a bit weathered, but that just adds character, right? Step into a world of regal nostalgia where history meets opportunity. This castle might need a little TLC, but think of it as a blank canvas for your dreams. The grand hall may have seen more elegant days, but with a dash of imagination, it could host the grandest of galas! Plus, the spacious chambers offer unique airflow options (a.k.a. the open windows), and the garden, well, let's call it an 'untamed paradise.'",
  num_beds: 478,
  num_bedrooms: 323,
  number_bathrooms: 311,
  price: 10000.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 35.6030,
  longitude: -82.5542
)

listing7_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle3.avif",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Castle/Castle2.jpeg"
]

listing7_photo_urls.each_with_index do |url, index|
  listing7.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end



# 8
listing8 = Listing.create!(
  host_id: 2,
  address: "42 Merlin's Way",
  title: "Wizard's Tower with a Magic Library",
  description: "Welcome to my venerable Wizard's Tower, a sanctuary of arcane wisdom and ancient enchantments. Ascend the spiraling staircases, and you'll find yourself amidst a trove of mystic knowledge and ethereal wonders. The walls, adorned with shimmering scrolls and starlit charts, whisper secrets of the cosmos. Gaze out the crystal windows, and you'll witness the dance of constellations, each one a tale of cosmic destiny. In the heart of the tower, an observatory reveals the very fabric of the universe, and the library contains tomes that hold answers to questions unasked. (Its larger on the inside...)",
  num_beds: 999999,
  num_bedrooms: 999999,
  number_bathrooms: 999999,
  price: 450.0,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 45.5122,
  longitude: -122.6587
)

listing8_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/WizardTower/WizardTower2.webp"
]

listing8_photo_urls.each_with_index do |url, index|
  listing8.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#9
listing9 = Listing.create!(
  host_id: 7,
  address: "123 Magma Avenue, Volcano City, VC 98765",
  title: "Volcano View Retreat",
  description: "Escape to the fiery heart of nature and witness the majestic power of a real volcano up close. The 'Volcano View Retreat' offers you a once-in-a-lifetime opportunity to experience the thrill of living on the edge of a live volcano. Feel the rumble, see the sparks, and embrace the heat as you stay in this unique and adventurous location. (Please note: Lava flows and eruptions are part of the natural charm of this retreat.)",
  num_beds: 5,
  num_bedrooms: 2,
  number_bathrooms: 2,
  price: 99.99,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 25.9876,
  longitude: -90.1234
)

listing9_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano3.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/Volcano/Volcano4.jpeg"
]

listing9_photo_urls.each_with_index do |url, index|
  listing9.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#10
listing10 = Listing.create!(
  host_id: 7,
  address: "42 Frosty Way, Arctic Village, AV 54321",
  title: "Arctic Tundra Getaway",
  description: "Experience the breathtaking beauty of the Arctic tundra in our cozy 'Arctic Tundra Getaway.' Nestled amidst a pristine frozen landscape, this retreat offers you a chance to witness the mesmerizing Northern Lights, explore icy landscapes, and observe unique Arctic wildlife. Embrace the serenity and stillness of this remote location.",
  num_beds: 7,
  num_bedrooms: 1,
  number_bathrooms: 1,
  price: 79.99,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: true,
  latitude: 70.9876,
  longitude: -160.1234
)

listing10_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra4.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra5.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra2.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/ArcticTundra/ArcticTundra3.jpeg"
]

listing10_photo_urls.each_with_index do |url, index|
  listing10.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

#11
listing11 = Listing.create!(
  host_id: 7,
  address: "9 Riches Road, Gemstone Valley, GV 45678",
  title: "The Treasure Hunter's Inn",
  description: "Embark on a quest for riches and adventure at 'The Treasure Hunter's Inn.' This rustic inn is a gathering place for daring explorers seeking hidden treasures, ancient relics, and legendary artifacts. Explore labyrinthine caves, decipher cryptic maps, and bask in the camaraderie of fellow treasure hunters. (Beware of traps and puzzles along the way!)",
  num_beds: 36,
  num_bedrooms: 18,
  number_bathrooms: 18,
  price: 5149.99,
  has_ac: true,
  has_wifi: true,
  has_pets_allowed: false,
  has_washer_dryer: true,
  latitude: 35.1234,
  longitude: -110.7890
)

listing11_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn2.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn5.avif",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/TreasureHunterInn/TreasureHunterInn4.jpeg"
]

listing11_photo_urls.each_with_index do |url, index|
  listing11.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end

listing12 = Listing.create!(
  host_id: 2,
  address: "123 Mirage Lane, Sand Dune Oasis, SD 98765",
  title: "Elemental Mage's Oasis",
  description: "Discover the secrets of elemental magic amidst the endless sands at the 'Elemental Mage's Oasis.' This mystical desert retreat is a sanctuary of elemental mastery, where you can learn the ancient arts of fire, earth, air, and water magic. Immerse yourself in the desert's tranquility and harness the power of the elements",
  num_beds: 4,
  num_bedrooms: 2,
  number_bathrooms: 1,
  price: 129.99,
  has_ac: false,
  has_wifi: true,
  has_pets_allowed: true,
  has_washer_dryer: false,
  latitude: 29.5678,
  longitude: -105.4321
)

listing12_photo_urls = [
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis1.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis2.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis5.webp",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis3.jpeg",
  "https://airdnd-fullstack-prj-seeds.s3.amazonaws.com/MageOasis/MageOasis4.jpeg"
]

listing12_photo_urls.each_with_index do |url, index|
  listing12.photos.attach(
    io: URI.open(url),
    filename: "photo_#{index + 1}"
  )
end






demo_user = User.find_by(email: 'demo@user.io')
seed_user2 = User.find_by(email: 'demo@user2.io')
seed_user3 = User.find_by(email: 'demo@user3.io')
seed_user4 = User.find_by(email: 'demo@user4.io')

listing1 = Listing.find(1)  
listing2 = Listing.find(2)  
listing3 = Listing.find(3)
listing4 = Listing.find(4)
listing5 = Listing.find(5)  
listing6 = Listing.find(6)  
listing7 = Listing.find(7)
listing8 = Listing.find(8)
listing9 = Listing.find(9)  
listing10 = Listing.find(10)  
listing11 = Listing.find(11)
listing12 = Listing.find(12)



puts "Creating past reservation data for demo_user..."

# Past trips
Reservation.create!(
  listing_id: listing1.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (5 * listing1.price),  # You can adjust the price as needed
  start_date: '2018-01-06',
  end_date: '2018-01-10'
)

Reservation.create!(
  listing_id: listing2.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 3,  # You can adjust the number of guests as needed
  total_price: (6 * listing2.price),  # You can adjust the price as needed
  start_date: '2018-03-15',
  end_date: '2018-03-20'
)

Reservation.create!(
  listing_id: listing3.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 4,  # You can adjust the number of guests as needed
  total_price: (7 * listing3.price),  # You can adjust the price as needed
  start_date: '2018-05-24',
  end_date: '2018-05-30'
)

Reservation.create!(
  listing_id: listing4.id,
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (4 * listing4.price),
  start_date: '2018-07-08',
  end_date: '2018-07-15',
)

Reservation.create!(
  listing_id: listing5.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 4,  # You can adjust the number of guests as needed
  total_price: (7 * listing5.price),  # You can adjust the price as needed
  start_date: '2018-05-24',
  end_date: '2018-05-30'
)

Reservation.create!(
  listing_id: listing6.id,
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (4 * listing6.price),
  start_date: '2018-07-08',
  end_date: '2018-07-15',
)

Reservation.create!(
  listing_id: listing7.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 4,  # You can adjust the number of guests as needed
  total_price: (7 * listing7.price),  # You can adjust the price as needed
  start_date: '2018-05-24',
  end_date: '2018-05-30'
)

Reservation.create!(
  listing_id: listing8.id,
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (4 * listing8.price),
  start_date: '2018-07-08',
  end_date: '2018-07-15',
)

Reservation.create!(
  listing_id: listing9.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 4,  # You can adjust the number of guests as needed
  total_price: (7 * listing9.price),  # You can adjust the price as needed
  start_date: '2018-05-24',
  end_date: '2018-05-30'
)

Reservation.create!(
  listing_id: listing10.id,
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (4 * listing10.price),
  start_date: '2018-07-08',
  end_date: '2018-07-15',
)



puts "Creating past reservation data foor seed_user2 (wiz)..."

Reservation.create!(
  listing_id: listing1.id,  # Replace with the actual listing ID
  guest_id: seed_user2.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (5 * listing1.price),  # You can adjust the price as needed
  start_date: '2019-01-06',
  end_date: '2019-01-10'
)

Reservation.create!(
  listing_id: listing2.id,  # Replace with the actual listing ID
  guest_id: seed_user2.id,
  num_guests: 3,  # You can adjust the number of guests as needed
  total_price: (6 * listing2.price),  # You can adjust the price as needed
  start_date: '2019-03-15',
  end_date: '2019-03-20'
)

Reservation.create!(
  listing_id: listing3.id,  # Replace with the actual listing ID
  guest_id: seed_user2.id,
  num_guests: 4,  # You can adjust the number of guests as needed
  total_price: (7 * listing3.price),  # You can adjust the price as needed
  start_date: '2019-05-24',
  end_date: '2019-05-30'
)

Reservation.create!(
  listing_id: listing4.id,
  guest_id: seed_user2.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (4 * listing4.price),
  start_date: '2019-07-08',
  end_date: '2019-07-15',
)

Reservation.create!(
  listing_id: listing5.id,  # Replace with the actual listing ID
  guest_id: seed_user2.id,
  num_guests: 4,  # You can adjust the number of guests as needed
  total_price: (7 * listing5.price),  # You can adjust the price as needed
  start_date: '2019-05-24',
  end_date: '2019-05-30'
)

Reservation.create!(
  listing_id: listing6.id,
  guest_id: seed_user2.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (4 * listing6.price),
  start_date: '2019-07-08',
  end_date: '2019-07-15',
)

Reservation.create!(
  listing_id: listing7.id,  # Replace with the actual listing ID
  guest_id: seed_user2.id,
  num_guests: 4,  # You can adjust the number of guests as needed
  total_price: (7 * listing7.price),  # You can adjust the price as needed
  start_date: '2019-05-24',
  end_date: '2019-05-30'
)

Reservation.create!(
  listing_id: listing8.id,
  guest_id: seed_user2.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (4 * listing8.price),
  start_date: '2019-07-08',
  end_date: '2019-07-15',
)

Reservation.create!(
  listing_id: listing9.id,  # Replace with the actual listing ID
  guest_id: seed_user2.id,
  num_guests: 4,  # You can adjust the number of guests as needed
  total_price: (7 * listing9.price),  # You can adjust the price as needed
  start_date: '2019-05-24',
  end_date: '2019-05-30'
)

Reservation.create!(
  listing_id: listing10.id,
  guest_id: seed_user2.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (4 * listing10.price),
  start_date: '2019-07-08',
  end_date: '2019-07-15',
)



puts "Creating past reservation data foor seed_user3 (atlentis)..."

Reservation.create!(
  listing_id: listing1.id,  
  guest_id: seed_user3.id,
  num_guests: 2,  
  total_price: (5 * listing1.price),  
  start_date: '2020-01-06',
  end_date: '2020-01-10'
)

Reservation.create!(
  listing_id: listing2.id,  
  guest_id: seed_user3.id,
  num_guests: 3,  
  total_price: (6 * listing2.price),  
  start_date: '2020-03-15',
  end_date: '2020-03-20'
)

Reservation.create!(
  listing_id: listing3.id,  
  guest_id: seed_user3.id,
  num_guests: 4,  
  total_price: (7 * listing3.price),  
  start_date: '2020-05-24',
  end_date: '2020-05-30'
)

Reservation.create!(
  listing_id: listing4.id,
  guest_id: seed_user3.id,
  num_guests: 2,  
  total_price: (4 * listing4.price),
  start_date: '2020-07-08',
  end_date: '2020-07-15',
)

Reservation.create!(
  listing_id: listing5.id,  
  guest_id: seed_user3.id,
  num_guests: 4,  
  total_price: (7 * listing5.price),  
  start_date: '2020-05-24',
  end_date: '2020-05-30'
)

Reservation.create!(
  listing_id: listing6.id,
  guest_id: seed_user3.id,
  num_guests: 2,
  total_price: (4 * listing6.price),
  start_date: '2020-07-08',
  end_date: '2020-07-15',
)

Reservation.create!(
  listing_id: listing7.id,  
  guest_id: seed_user3.id,
  num_guests: 4,  
  total_price: (7 * listing7.price),  
  start_date: '2020-05-24',
  end_date: '2020-05-30'
)

Reservation.create!(
  listing_id: listing8.id,
  guest_id: seed_user3.id,
  num_guests: 2,  
  total_price: (4 * listing8.price),
  start_date: '2020-07-08',
  end_date: '2020-07-15',
)

Reservation.create!(
  listing_id: listing9.id,  
  guest_id: seed_user3.id,
  num_guests: 4,  
  total_price: (7 * listing9.price),  
  start_date: '2020-05-24',
  end_date: '2020-05-30'
)

Reservation.create!(
  listing_id: listing10.id,
  guest_id: seed_user3.id,
  num_guests: 2,  
  total_price: (4 * listing10.price),
  start_date: '2020-07-08',
  end_date: '2020-07-15',
)



puts "Creating past reservation data foor seed_user4 (horror)..."

Reservation.create!(
  listing_id: listing1.id,  
  guest_id: seed_user4.id,
  num_guests: 2,  
  total_price: (5 * listing1.price),  
  start_date: '2021-01-06',
  end_date: '2021-01-10'
)

Reservation.create!(
  listing_id: listing2.id,  
  guest_id: seed_user4.id,
  num_guests: 3,  
  total_price: (6 * listing2.price),  
  start_date: '2021-03-15',
  end_date: '2021-03-20'
)

Reservation.create!(
  listing_id: listing3.id,  
  guest_id: seed_user4.id,
  num_guests: 4,  
  total_price: (7 * listing3.price),  
  start_date: '2021-05-24',
  end_date: '2021-05-30'
)

Reservation.create!(
  listing_id: listing4.id,
  guest_id: seed_user4.id,
  num_guests: 2,  
  total_price: (4 * listing4.price),
  start_date: '2021-07-08',
  end_date: '2021-07-15',
)

Reservation.create!(
  listing_id: listing5.id,  
  guest_id: seed_user4.id,
  num_guests: 4,  
  total_price: (7 * listing5.price),  
  start_date: '2021-05-24',
  end_date: '2021-05-30'
)

Reservation.create!(
  listing_id: listing6.id,
  guest_id: seed_user4.id,
  num_guests: 2,
  total_price: (4 * listing6.price),
  start_date: '2021-07-08',
  end_date: '2021-07-15',
)

Reservation.create!(
  listing_id: listing7.id,  
  guest_id: seed_user4.id,
  num_guests: 4,  
  total_price: (7 * listing7.price),  
  start_date: '2021-05-24',
  end_date: '2021-05-30'
)

Reservation.create!(
  listing_id: listing8.id,
  guest_id: seed_user4.id,
  num_guests: 2,  
  total_price: (4 * listing8.price),
  start_date: '2021-07-08',
  end_date: '2021-07-15',
)

Reservation.create!(
  listing_id: listing11.id,  
  guest_id: seed_user4.id,
  num_guests: 4,  
  total_price: (7 * listing11.price),  
  start_date: '2021-05-24',
  end_date: '2021-05-30'
)

Reservation.create!(
  listing_id: listing12.id,
  guest_id: seed_user4.id,
  num_guests: 2,  
  total_price: (4 * listing12.price),
  start_date: '2021-07-08',
  end_date: '2021-07-15',
)




# Current trips demo user
Reservation.create!(
  listing_id: listing1.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (5 * listing1.price),  # You can adjust the price as needed
  start_date: '2022-01-06',
  end_date: '2030-01-10'
)

Reservation.create!(
  listing_id: listing2.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (5 * listing2.price),  # You can adjust the price as needed
  start_date: '2022-01-06',
  end_date: '2030-01-10'
)


# Up comming trips demo user
Reservation.create!(
  listing_id: listing3.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (5 * listing3.price),  # You can adjust the price as needed
  start_date: '2030-01-06',
  end_date: '2031-01-10'
)

Reservation.create!(
  listing_id: listing4.id,  # Replace with the actual listing ID
  guest_id: demo_user.id,
  num_guests: 2,  # You can adjust the number of guests as needed
  total_price: (5 * listing4.price),  # You can adjust the price as needed
  start_date: '2030-01-06',
  end_date: '2031-01-10'
)





puts "Creating reviews data for all listings..."
#1
Review.create!(
  listing_id: 1,
  reviewer_id: 1,
  reservation_id: 1,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 5,
  body: "A truly magical experience! The Cozy Cabin in the Woods exceeded all expectations. The creaking floorboards and flickering candlelight added to the charm. Would definitely visit again."
)

#2
Review.create!(
  listing_id: 2,
  reviewer_id: 1,
  reservation_id: 2,
  cleanliness: 4,
  accuracy: 4,
  value: 4,
  communication: 4,
  check_in: 4,
  location: 4,
  rating: 4,
  body: "I recently stayed at the 'Cozy Cabin in the Woods' and found it to be a perfect getaway. The rustic charm and serene forest location create a relaxing atmosphere. The description is accurate, but a few creaking floorboards and dim candlelight earned it 4 stars. It's well-equipped, though lacking a washer/dryer, and there's no Wi-Fi for those needing connectivity. Despite these minor quirks, it's an excellent place to unplug and unwind in a unique setting, making it a recommended choice for a peaceful retreat."
)

#3
Review.create!(
  listing_id: 3,
  reviewer_id: 1,
  reservation_id: 3,
  cleanliness: 3,
  accuracy: 3,
  value: 3,
  communication: 3,
  check_in: 3,
  location: 3,
  rating: 3,
  body: "Recently, I had the opportunity to stay at the 'Cozy Cabin in the Woods.' While the location and rustic charm were appealing, a few aspects left me somewhat unsatisfied. The description accurately sets expectations, but the constant creaking floorboards and dim candlelight made the experience less comfortable than anticipated. The absence of Wi-Fi was a drawback for me, as I needed to stay connected during my stay. Additionally, the lack of a washer/dryer was inconvenient for a longer stay. Overall, the cabin has potential, but some improvements are needed to enhance the experience and justify a higher rating."
)

#4
Review.create!(
  listing_id: 4,
  reviewer_id: 1,
  reservation_id: 4,
  cleanliness: 2,
  accuracy: 2,
  value: 2,
  communication: 2,
  check_in: 2,
  location: 2,
  rating: 2,
  body: "I recently stayed at the 'Cozy Cabin in the Woods,' and I must say it didn't live up to my expectations. The description is somewhat accurate, but the constant creaking floorboards and dim candlelight were quite bothersome and made me feel uneasy. The lack of Wi-Fi was a significant drawback, as I needed to stay connected for work, and the absence of a washer/dryer was inconvenient for a longer stay. Furthermore, the overall cleanliness of the cabin left much to be desired. I wouldn't recommend this place unless you're specifically looking for an extremely rustic and disconnected experience."
)

#5
Review.create!(
  listing_id: 5,
  reviewer_id: 1,
  reservation_id: 5,
  cleanliness: 1,
  accuracy: 1,
  value: 1,
  communication: 1,
  check_in: 1,
  location: 1,
  rating: 1,
  body: "Staying at the 'Hobbit Hole in the Shire' was a truly disappointing experience. The description promises a charming and cozy hobbit-inspired dwelling, but the reality was far from it. The place is incredibly cramped with just one bed and one bedroom, and the earthy walls felt more like a damp cave. The lack of air conditioning made it uncomfortable, and the handcrafted furnishings were less 'rustic elegance' and more 'uncomfortable and impractical.' The lush green roof let in more critters than sunlight, and the Wi-Fi was the only redeeming feature. The notion of allowing pets might be cute for hobbits, but it attracted pests I couldn't stand. Overall, this listing fell far short of my expectations, and I would strongly advise against booking it unless you have a deep love for hobbit holes and are willing to tolerate significant discomfort."
)

#6
Review.create!(
  listing_id: 6,
  reviewer_id: 1,
  reservation_id: 6,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 4,
  check_in: 4,
  location: 4,
  rating: 4.5,
  body: "I recently stayed at the 'Hobbit Hole in the Shire,' and it was a magical experience. The cozy charm, unique design, and natural ambiance were enchanting. It's perfect for a romantic getaway, and the Wi-Fi was a pleasant surprise. Allowing pets is a bonus for animal lovers. While it's nearly perfect, a few minor inconveniences kept it from a 5-star rating. Nevertheless, I highly recommend it for a one-of-a-kind stay."
)

#7
Review.create!(
  listing_id: 7,
  reviewer_id: 1,
  reservation_id: 7,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 1,
  check_in: 1,
  location: 1,
  rating: 3,
  body: "Great place to go was really fun"
)

#8
Review.create!(
  listing_id: 8,
  reviewer_id: 1,
  reservation_id: 8,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 2,
  check_in: 2,
  location: 2,
  rating: 3.5,
  body: "Was pretty cool, ive never lived in an underground house b4"
)

#9
Review.create!(
  listing_id: 9,
  reviewer_id: 1,
  reservation_id: 9,
  cleanliness: 4,
  accuracy: 4,
  value: 4,
  communication: 3,
  check_in: 3,
  location: 3,
  rating: 3.5,
  body: "Was really magical, had a lot of cool magic lamps, was a really long walk to the top each night though"
)

#10
Review.create!(
  listing_id: 10,
  reviewer_id: 1,
  reservation_id: 10,
  cleanliness: 3,
  accuracy: 3,
  value: 3,
  communication: 4,
  check_in: 4,
  location: 4,
  rating: 3.5,
  body: "Had a great time, spent most of the night lookoing out from the top of the tower"
)

#11
Review.create!(
  listing_id: 1,
  reviewer_id: 2,
  reservation_id: 11,
  cleanliness: 2,
  accuracy: 2,
  value: 2,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 3.5,
  body: "Pretty average adventure the magical parts were cool though."
)

#12
Review.create!(
  listing_id: 2,
  reviewer_id: 2,
  reservation_id: 12,
  cleanliness: 1,
  accuracy: 1,
  value: 1,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 3,
  body: "It was nice"
)

#13
Review.create!(
  listing_id: 3,
  reviewer_id: 2,
  reservation_id: 13,
  cleanliness: 3,
  accuracy: 3,
  value: 3,
  communication: 3,
  check_in: 3,
  location: 3,
  rating: 3,
  body: "It's a very fun place to be with plenty to eat everywhere, but I was tired all the time and had a hard time staying awake the whole night."
)

#14
Review.create!(
  listing_id: 4,
  reviewer_id: 2,
  reservation_id: 14,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 5,
  body: "I had the most delightful experience at the Candy Cabin! It's a sweet paradise for anyone with a sweet tooth. The cabin is filled with an endless variety of delicious candies and treats, and the cozy atmosphere makes it feel like a magical candy wonderland. The owner's attention to detail and warm hospitality added to the charm. I couldn't have asked for a better place to satisfy my candy cravings. It's a true 5-star gem that I highly recommend to anyone looking for a sugary escape!"
)

#15
Review.create!(
  listing_id: 5,
  reviewer_id: 2,
  reservation_id: 15,
  cleanliness: 4,
  accuracy: 4,
  value: 4,
  communication: 4,
  check_in: 4,
  location: 4,
  rating: 4,
  body: "Staying at the Candy Cabin was a sugary delight! The cabin is a whimsical retreat for candy lovers, and the array of treats is simply fantastic. The cozy atmosphere and candy-themed decor create a fun and inviting ambiance. The owner was friendly and accommodating, making our stay enjoyable. The only reason I'm not giving it a perfect 5 stars is because the variety could be even more extensive, but it's still a wonderful place for a sweet escape."
)

#16
Review.create!(
  listing_id: 6,
  reviewer_id: 2,
  reservation_id: 16,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 5,
  check_in: 5,
  location: 1,
  rating: 4.3,
  body: "Despite the Candy Cabin being a sugary paradise for candy enthusiasts, I must admit I wasn't thrilled with the location. It's a bit out of the way and not as convenient as I had hoped. However, once inside, the cabin truly shines with its delectable assortment of candies and delightful decor. The owner's warmth and enthusiasm were wonderful. While the location isn't perfect, I'd still recommend it to fellow candy lovers for a sweet retreat."
)

#17
Review.create!(
  listing_id: 7,
  reviewer_id: 2,
  reservation_id: 17,
  cleanliness: 1,
  accuracy: 5,
  value: 5,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 4.3,
  body: "My visit to Atlantis, the legendary underwater city, was truly mesmerizing. The city's architecture and the underwater world's marvels are a sight to behold. However, I must admit I was somewhat disappointed by the cleanliness. There were some areas that could have been better maintained, given the city's legendary status. Despite this minor issue, the overall experience was unforgettable, and I would recommend Atlantis to anyone seeking an extraordinary underwater adventure."
)

#18
Review.create!(
  listing_id: 8,
  reviewer_id: 2,
  reservation_id: 18,
  cleanliness: 1,
  accuracy: 1,
  value: 1,
  communication: 1,
  check_in: 1,
  location: 5,
  rating: 1.6,
  body: "While the location of Atlantis was undeniably stunning, my overall experience was far from satisfactory. The city's underwater setting was awe-inspiring, and the marine life was impressive. However, nearly every other aspect left much to be desired. The cleanliness was subpar, and the accommodations were uncomfortable. It's clear that Atlantis has the potential to be a true marvel, but it fell far short of expectations in almost every other regard."
)

#19
Review.create!(
  listing_id: 9,
  reviewer_id: 2,
  reservation_id: 19,
  cleanliness: 5,
  accuracy: 1,
  value: 1,
  communication: 1,
  check_in: 1,
  location: 1,
  rating: 1.6,
  body: "Atlantis left me with mixed feelings. While the cleanliness of the underwater city was commendable, I found other aspects disappointing. The city was pristine, and the surroundings were well-maintained, which contributed to a pleasant atmosphere. However, the city's overall aesthetic and attractions didn't live up to the legendary status I had anticipated. I appreciate the cleanliness, but I was hoping for a more enchanting and immersive experience in Atlantis."
)

#20
Review.create!(
  listing_id: 10,
  reviewer_id: 2,
  reservation_id: 20,
  cleanliness: 3,
  accuracy: 3,
  value: 3,
  communication: 3,
  check_in: 3,
  location: 4,
  rating: 3.1,
  body: "My visit to Atlantis was an average experience across the board. The location, while stunning, was somewhat challenging to reach, and the check-in process was smooth but not exceptional. The value for the price paid was reasonable, but I expected a bit more given the legendary reputation of the city. The cleanliness was decent, but not outstanding. The underwater setting and marine life were impressive, but the overall ambiance didn't quite match the Atlantis of my imagination. In summary, it's a decent destination, but it fell short of higher expectations in several aspects."
)

#21
Review.create!(
  listing_id: 1,
  reviewer_id: 3,
  reservation_id: 21,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 5,
  body: "My stay at the Dragon's Den Retreat was absolutely exceptional. Every aspect, from cleanliness, accuracy, value, communication, check-in, to the location, exceeded all expectations. The accommodations were spotless and precisely as described, providing outstanding value for the price. The host's communication was not only prompt but also incredibly helpful, and the check-in process was seamless. The location was not just convenient but also added to the enchantment of the retreat. I can't give it anything less than a perfect 5-star rating and highly recommend it to anyone seeking a fantastic experience."
)

#22
Review.create!(
  listing_id: 2,
  reviewer_id: 3,
  reservation_id: 22,
  cleanliness: 4,
  accuracy: 4,
  value: 4,
  communication: 4,
  check_in: 4,
  location: 4,
  rating: 4,
  body: "My stay at the Dragon's Den Retreat was a very pleasant experience. Everything about the retreat, from cleanliness, accuracy, value, communication, check-in, to the location, met or exceeded my expectations. The accommodations were clean and accurately described, offering good value for the price. The host's communication and check-in process were efficient and welcoming. The location was not only convenient but also added to the overall charm of the retreat. It's a solid 4-star rating, and I would gladly recommend it to others."
)

#23
Review.create!(
  listing_id: 3,
  reviewer_id: 3,
  reservation_id: 23,
  cleanliness: 3,
  accuracy: 3,
  value: 3,
  communication: 3,
  check_in: 3,
  location: 3,
  rating: 3,
  body: "My stay at the Dragon's Den Retreat was a middle-of-the-road experience. The cleanliness, accuracy, value, communication, check-in, and location were all average and met my expectations. The accommodations were clean and as described, offering fair value for the price. The host's communication and the check-in process were smooth and hassle-free. The location was convenient and accessible. While it didn't exceed my expectations, it provided a satisfactory stay for a solid 3-star rating."
)

#24
Review.create!(
  listing_id: 4,
  reviewer_id: 3,
  reservation_id: 24,
  cleanliness: 2,
  accuracy: 2,
  value: 2,
  communication: 2,
  check_in: 2,
  location: 2,
  rating: 2,
  body: "My stay at the Enchanted Hillside Castle was far from enchanting. While the cleanliness, accuracy, value, communication, check-in, and location were all subpar, they managed to avoid the absolute worst rating. The place was moderately clean, but not up to standard. The accuracy was somewhat close to the description, but it left much to be desired. The value was marginal for what was provided, and communication and check-in were only slightly better. The remote location added to the challenges of the stay. Overall, it was a disappointing experience, but it didn't reach the level of a complete disaster."
)

#25
Review.create!(
  listing_id: 5,
  reviewer_id: 3,
  reservation_id: 25,
  cleanliness: 1,
  accuracy: 1,
  value: 1,
  communication: 1,
  check_in: 1,
  location: 1,
  rating: 1,
  body: "My stay at the Enchanted Hillside Castle was an absolute disaster in every aspect. The cleanliness was appalling, with dirt and grime everywhere. The listing's accuracy was a blatant misrepresentation of the actual conditions. The value was non-existent given the deplorable state of the accommodations. Communication with the host was frustratingly poor, and the check-in process was chaotic. The location was remote and inaccessible, adding to the overall frustration. I wouldn't recommend this place to my worst enemy, and a 1-star rating is overly generous for this abysmal experience."
)

#26
Review.create!(
  listing_id: 6,
  reviewer_id: 3,
  reservation_id: 26,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 4,
  check_in: 4,
  location: 4,
  rating: 4.5,
  body: "Amazing time loved every moment of it"
)

#27
Review.create!(
  listing_id: 7,
  reviewer_id: 3,
  reservation_id: 27,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 1,
  check_in: 1,
  location: 1,
  rating: 3,
  body: "My stay at the Wizard's Tower with a Magic Library was intriguing and unique, but it fell short in terms of magical texts and service. The concept is memorable, and the accommodations were comfortable, but the library lacked a variety of enchanting texts, and the staff had limited magical knowledge. It's a place with potential but didn't fully deliver the magical experience I had hoped for."
)

#28
Review.create!(
  listing_id: 8,
  reviewer_id: 3,
  reservation_id: 28,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 2,
  check_in: 2,
  location: 2,
  rating: 3.5,
  body: "My stay at the Wizard's Tower with a Magic Library was a mixed experience. The sheer novelty of staying in a tower with a magic library was intriguing and added a unique charm to the place. The accommodations were comfortable and adequately furnished, and the library provided an otherworldly ambiance. However, the service and amenities were not without their flaws. While the staff was friendly, their knowledge of the library's magical texts was limited, and the overall service could have been more attentive. It's a place for those seeking a one-of-a-kind experience, but it didn't quite live up to all my magical expectations."
)

#29
Review.create!(
  listing_id: 9,
  reviewer_id: 3,
  reservation_id: 29,
  cleanliness: 4,
  accuracy: 4,
  value: 4,
  communication: 3,
  check_in: 3,
  location: 3,
  rating: 3.5,
  body: "Had a good time, I would come back again"
)

#30
Review.create!(
  listing_id: 10,
  reviewer_id: 3,
  reservation_id: 30,
  cleanliness: 3,
  accuracy: 3,
  value: 3,
  communication: 4,
  check_in: 4,
  location: 4,
  rating: 3.5,
  body: "Had a great time, spent most of the night lookoing out from the top of the view"
)

#31
Review.create!(
  listing_id: 1,
  reviewer_id: 4,
  reservation_id: 31,
  cleanliness: 2,
  accuracy: 2,
  value: 2,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 3.5,
  body: "My stay at the Volcano View Retreat was a mixed experience. The location, with its stunning view of the volcano, was undeniably captivating, and the natural surroundings were breathtaking. The accommodations were comfortable, and the amenities were well-maintained. However, the service fell short of a 4 or 5-star experience. The staff was friendly, but there were some hiccups in terms of responsiveness and attention to detail. While the setting was exceptional, it was the service that prevented me from giving it a higher rating."
)

#32
Review.create!(
  listing_id: 2,
  reviewer_id: 4,
  reservation_id: 32,
  cleanliness: 1,
  accuracy: 1,
  value: 1,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 3,
  body: "It was nice"
)

#33
Review.create!(
  listing_id: 3,
  reviewer_id: 4,
  reservation_id: 33,
  cleanliness: 3,
  accuracy: 3,
  value: 3,
  communication: 3,
  check_in: 3,
  location: 3,
  rating: 3,
  body: "My Arctic Tundra Getaway was a mixed experience. The location was undeniably beautiful, with the raw and untouched landscape of the Arctic tundra creating a sense of awe. However, the accommodations, while functional, felt a bit too basic for the price, and the extreme cold made it a bit challenging to stay warm, even with the provided gear. The staff was friendly, but the service was not exceptional. While the natural beauty of the tundra was worth the trip, the overall experience left me with a sense of wanting more in terms of comfort and service."
)

#34
Review.create!(
  listing_id: 4,
  reviewer_id: 4,
  reservation_id: 34,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 5,
  body: "My Arctic Tundra Getaway was nothing short of extraordinary. The location was an absolute wonder, with the stark, pristine beauty of the Arctic tundra taking my breath away. The accommodations were cozy and thoughtfully designed to withstand the cold, ensuring a comfortable stay. The staff went above and beyond to make our experience unforgettable, providing expert guidance and knowledge about the region. The extreme weather conditions only added to the adventure, making it a true once-in-a-lifetime experience. I can't recommend this Arctic Tundra Getaway enough for those seeking a unique and awe-inspiring journey into the frozen wilderness."
)

#35
Review.create!(
  listing_id: 5,
  reviewer_id: 4,
  reservation_id: 35,
  cleanliness: 4,
  accuracy: 4,
  value: 4,
  communication: 4,
  check_in: 4,
  location: 4,
  rating: 4,
  body: "My Arctic Tundra Getaway was a truly remarkable experience. The location offered an unparalleled sense of isolation and natural beauty, and the vast, frozen landscape was breathtaking. The accommodations were cozy and well-equipped, keeping us warm in the extreme cold. The staff provided excellent service, ensuring our safety and comfort throughout our stay. While it wasn't a perfect 5-star experience due to the challenging weather conditions, it was an adventure I'll always remember and recommend to fellow nature enthusiasts."
)

#36
Review.create!(
  listing_id: 6,
  reviewer_id: 4,
  reservation_id: 36,
  cleanliness: 5,
  accuracy: 5,
  value: 5,
  communication: 5,
  check_in: 5,
  location: 1,
  rating: 4.3,
  body: "I had a great time during my stay at The Treasure Hunter's Inn. The inn's location was quite interesting, with a unique and rustic atmosphere that added to the experience. The room was clean and cozy, and while the amenities weren't luxurious, they were sufficient for a comfortable stay. The staff was friendly and helpful, and I appreciated their hospitality. Overall, it was a good experience that I would recommend for a unique and charming getaway."
)

#37
Review.create!(
  listing_id: 7,
  reviewer_id: 4,
  reservation_id: 37,
  cleanliness: 1,
  accuracy: 5,
  value: 5,
  communication: 5,
  check_in: 5,
  location: 5,
  rating: 4.3,
  body: "My recent stay at The Treasure Hunter's Inn was quite pleasant. The location had a unique charm, with its rustic appearance giving it a distinct character. The room was clean and comfortable, and although the amenities were not extravagant, they served their purpose well. The staff was friendly and accommodating, making our stay enjoyable. While it wasn't a 5-star experience, it certainly exceeded my expectations for a 4-star rating, and I would consider returning in the future."
)

#38
Review.create!(
  listing_id: 8,
  reviewer_id: 4,
  reservation_id: 38,
  cleanliness: 1,
  accuracy: 1,
  value: 1,
  communication: 1,
  check_in: 1,
  location: 5,
  rating: 1.6,
  body: "My stay at The Treasure Hunter's Inn was a complete nightmare. The location was sketchy, and the inn's exterior had seen better days. The room I was assigned was dirty, and the amenities were practically nonexistent. The staff seemed disinterested and unhelpful, making the overall experience even more frustrating. It's safe to say this was one of the worst accommodations I've ever encountered, and I would strongly advise against booking a stay at The Treasure Hunter's Inn."
)

#39
Review.create!(
  listing_id: 11,
  reviewer_id: 4,
  reservation_id: 39,
  cleanliness: 5,
  accuracy: 1,
  value: 1,
  communication: 1,
  check_in: 1,
  location: 1,
  rating: 1.6,
  body: "My stay at the Oasis was a complete disappointment. The location was misleading, as it was far from the idyllic paradise I had envisioned. The accommodations were in poor condition, with uncomfortable bedding and lackluster amenities. The cleanliness was subpar, and the service left much to be desired. It's safe to say this was one of the worst experiences I've had, and I would strongly advise against booking a stay at this so-called 'Oasis."
)

#40
Review.create!(
  listing_id: 12,
  reviewer_id: 4,
  reservation_id: 40,
  cleanliness: 3,
  accuracy: 3,
  value: 3,
  communication: 3,
  check_in: 3,
  location: 4,
  rating: 3.1,
  body: "My stay at the Oasis was an average experience. While the location was peaceful and the natural surroundings were beautiful, the overall experience didn't quite live up to my expectations. The accommodations were comfortable but not luxurious, and the amenities were basic. Additionally, the service was adequate but not exceptional. It's a decent place for a relaxing getaway, but it didn't offer that extra touch to make it a memorable 4 or 5-star experience."
)

puts "Done!"