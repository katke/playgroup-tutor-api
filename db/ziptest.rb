# filedata = File.open("zipcodelist.csv").readlines.map(&:chomp)
# filedata.each { |line_of_data|
#   array = line_of_data.split(",")
#   zip_hash[array[0]] = [array[1].to_f, array[2].to_f]
#   Zipcode.create!(zipcode: array[0], latitude: array[1].to_f, longitude: array[2].to_f)
# }
require "faker"
require "http"
# User.create!(email: "bob@test.com", password: "password", first_name: "Michelle", zipcode: "60067", latitude: Location.find_by(zipcode: "60067").latitude, longitude: Location.find_by(zipcode: "60067").longitude, profile_picture: "https://c1.scryfall.com/file/scryfall-cards/art_crop/front/6/5/65b7275a-5305-42e6-b5c3-8b88568b4e28.jpg?1562819184", age: 21, about_me: "Hey what's up guys")
pp Faker::Hipster.paragraph(sentence_count: 3)
p Faker::Name.unique.first_name
p Faker::Internet.unique.email(name: "Nancy")

user = { email: Faker::Internet.unique.email, password: "password", first_name: Faker::Name.first_name, zipcode: rand(60001..62999).to_s, profile_picture: HTTP.get("https://api.scryfall.com/cards/random").parse()["image_uris"]["art_crop"], age: rand(21..39) }

p Faker::Internet.unique.email(name: "Nancy")
p Faker::Internet.unique.email(name: "Nancy")
p Faker::Internet.unique.email(name: "Nancy")
