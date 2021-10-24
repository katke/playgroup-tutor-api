require "faker"
# # zipcodes
# filedata = File.open("./db/zipcodelist.csv").readlines.map(&:chomp)
# filedata = filedata.drop(1)
# filedata.each { |line_of_data|
#   array = line_of_data.split(",")
#   Location.create!(zipcode: array[0], latitude: array[1].to_f, longitude: array[2].to_f)
# }
# #new users
# User.create!(email: "dave@gmail.com", password: "password", first_name: "Dave", zipcode: "60067", latitude: Location.find_by(zipcode: "60067").latitude, longitude: Location.find_by(zipcode: "60067").longitude, profile_picture: "https://c1.scryfall.com/file/scryfall-cards/art_crop/front/1/6/1671013a-2c15-44f0-b4bc-057eb5f727db.jpg?1562701916", age: 32, about_me: "Hi, looking for a group to practice some standard deck or play arena")
# User.create!(email: "test@test.com", password: "password", first_name: "Jack", zipcode: "60007", latitude: Location.find_by(zipcode: "60067").latitude, longitude: Location.find_by(zipcode: "60067").longitude, profile_picture: "https://c1.scryfall.com/file/scryfall-cards/art_crop/front/5/a/5adcb500-8c77-4925-8e2c-1243502827d1.jpg?1604243976", age: 25, about_me: "Just about_me: looking for a store that plays legacy, anyone know?")
# User.create!(email: "joe@test.com", password: "password", first_name: "Joe", zipcode: "60188", latitude: Location.find_by(zipcode: "60188").latitude, longitude: Location.find_by(zipcode: "60188").longitude, profile_picture: "https://c1.scryfall.com/file/scryfall-cards/art_crop/front/c/d/cd1deda0-c99d-4570-a5dd-f51eb5d12570.jpg?1562267420", age: 29, about_me: "What is this thing??")
# User.create!(email: "bob@test.com", password: "password", first_name: "Michelle", zipcode: "60067", latitude: Location.find_by(zipcode: "60067").latitude, longitude: Location.find_by(zipcode: "60067").longitude, profile_picture: "https://c1.scryfall.com/file/scryfall-cards/art_crop/front/6/5/65b7275a-5305-42e6-b5c3-8b88568b4e28.jpg?1562819184", age: 21, about_me: "Hey what's up guys")
# #loop

20.times do
  location = Location.find_by(id: rand(21001..21422))
  bot = User.new(password: "password", first_name: Faker::Name.first_name, latitude: location.latitude, longitude: location.longitude, profile_picture: HTTP.get("https://api.scryfall.com/cards/random").parse()["image_uris"]["art_crop"], age: rand(21..39))
  bot.email = Faker::Internet.unique.email(name: "#{bot.first_name}")
  bot.about_me = "Hi! I'm a bot named #{bot.first_name}. My favorite album is #{Faker::Music.album}. #{Faker::TvShows::Simpsons.quote}"
  bot.save
  sleep(1)
end
# #their formats
# Favoriteformat.create!(format: "EDH", user_id: 1)
# Favoriteformat.create!(format: "Cube", user_id: 1)
# Favoriteformat.create!(format: "Legacy", user_id: 1)
# Favoriteformat.create!(format: "EDH", user_id: 2)
# Favoriteformat.create!(format: "Cube", user_id: 2)
# #their relationships
# Relationship.create!(requester_id: 1, responder_id: 2, status: "Accepted")
# Relationship.create!(requester_id: 3, responder_id: 2, status: "Accepted")
# Relationship.create!(requester_id: 3, responder_id: 1, status: "Pending")
# Relationship.create!(requester_id: 4, responder_id: 1, status: "Blocked")
# Relationship.create!(requester_id: 4, responder_id: 2, status: "Blocked")
# Relationship.create!(requester_id: 4, responder_id: 3, status: "Pending")
# #their messages
# Message.create!(sender_id: 1, receiver_id: 2, text: "hi jack")
# Message.create!(sender_id: 2, receiver_id: 1, text: "what's up?")
# Message.create!(sender_id: 1, receiver_id: 2, text: "do you play cube?")
# Message.create!(sender_id: 2, receiver_id: 1, text: "I've never tried it, but i'd be willing to play")
# Message.create!(sender_id: 1, receiver_id: 2, text: "Cool! Let's play on Friday at <insert local game store>")
# Message.create!(sender_id: 2, receiver_id: 1, text: "ok")
# Message.create!(sender_id: 3, receiver_id: 1, text: "hey")
# User.all.each { |user|
#   User.find_by(id: user.id).latitude = Location.find_by(zipcode: user.zipcode).latitude
#   User.find_by(id: user.id).longitude = Location.find_by(zipcode: user.zipcode).longitude
# }
