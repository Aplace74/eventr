# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'date'

puts "Clearing DB..."
Contribution.destroy_all
Participation.destroy_all
Supply.destroy_all
Category.destroy_all
Event.destroy_all
User.destroy_all

puts "Cleaning OK"
puts "................."
puts "Creating users..."

chris = User.create!(
    first_name: "Christophe",
    last_name: "Lepretre",
    email: "chrislep62@gmail.com",
    password: "123456"
)
chris.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHJNRSJ2X-8033519bd289-48"
chris.save

max = User.create!(
  first_name: "Maxime",
  last_name: "Derouet",
  email: "mxderouet@gmail.com",
  password: "password"
)
max.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHJNDRP50-4cbef4975b23-48"
max.save

aym = User.create!(
  first_name: "Aymeric",
  last_name: "Dhalluin",
  email: "aymeric.dhalluin@gmail.com",
  password: "123456"
)
aym.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHVHHPMT6-070fc749feb5-48"
aym.save

anto = User.create!(
  first_name: "Antoine",
  last_name: "Place",
  email: "antoineplace2212@gmail.com",
  password: "123456"
)
anto.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHW3LLS4V-bbfea18ca08e-48"
anto.save

users = [chris, aym, anto, max]

puts "Users OK"
puts ".................."
puts "Creating Events..."

barbecue = Event.create!(
  description: "Un chouette barbecue avec tous les copains dans la maison de mes parents",
  title: "BBQ chez mes parents",
  start_date: Date.new(2019, 6, 19),
  end_date: Date.new(2019, 6, 19),
  picture: "",
  address: "7 rue du Pont Neuf",
  city: "Marcq-en-Baroeul", 
  zipcode: "59300",
  user_id: max[:id],
  token: (0...10).map { (65 + rand(26)).chr }.join
)
barbecue.remote_picture_url = "http://res.cloudinary.com/startmeuplille/image/upload/v1559728867/evt02xw2kvy7hmuzwmkq.jpg"
barbecue.save

Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: max[:id],
  organizer: true
)

anniversaire = Event.create!(
  description: "Je compte sur vous pour être présent",
  title: "25 ans Antoine",
  start_date: Date.new(2019, 6, 10),
  end_date: Date.new(2019, 6, 10),
  picture: "",
  address: "105 rue de la Monnaie",
  city: "Lille", 
  zipcode: "59000",
  user_id: anto[:id],
  token: (0...10).map { (65 + rand(26)).chr }.join
)
anniversaire.remote_picture_url = "http://res.cloudinary.com/startmeuplille/image/upload/v1559729073/y7i99pftlhehn6cwjrbu.jpg"
anniversaire.save

Participation.create!(
  confirmed: true,
  event_id: anniversaire[:id],
  user_id: anto[:id],
  organizer: true
)

piscine = Event.create!(
  description: "Après-midi piscine à la cambrousse",
  title: "Pool Party",
  start_date: Date.new(2019, 6, 26),
  end_date: Date.new(2019, 6, 26),
  picture: "",
  address: "33 rue du Chateau",
  city: "Lambersart", 
  zipcode: "59130",
  user_id: aym[:id],
  token: (0...10).map { (65 + rand(26)).chr }.join
)
piscine.remote_picture_url = "http://res.cloudinary.com/startmeuplille/image/upload/v1559729372/ggyt6qrjmueobqayovvx.jpg"
piscine.save

Participation.create!(
  confirmed: true,
  event_id: piscine[:id],
  user_id: aym[:id],
  organizer: true
)

juillet_14 = Event.create!(
  description: "Feu d'artifice à la grange",
  title: "14 juillet",
  start_date: Date.new(2019, 7, 14),
  end_date: Date.new(2019, 7, 15),
  picture: "",
  address: "100 rue des Petis",
  city: "Lomme", 
  zipcode: "59200",
  user_id: chris[:id],
  token: (0...10).map { (65 + rand(26)).chr }.join
)
piscine.remote_picture_url = "http://res.cloudinary.com/startmeuplille/image/upload/v1559729372/ggyt6qrjmueobqayovvx.jpg"
piscine.save

Participation.create!(
  confirmed: true,
  event_id: juillet_14[:id],
  user_id: chris[:id],
  organizer: true
) 

puts "Users & events OK !"
puts "...................."
puts "Adding Categories..."

drinks = Category.create!(
  name: "Boissons"
)

food = Category.create!(
  name: "Nourriture"
)

other = Category.create!(
  name: "Autres"
)

puts "Categories OK !"
puts ".................."
puts "Adding supplies..."

saucisses = Supply.create!(
  title: "Saucisses",
  quantity: 12,
  category_id: food[:id],
  event_id: piscine[:id]
)

baguettes = Supply.create!(
  title: "Baguettes",
  quantity: 5,
  category_id: food[:id],
  event_id: anniversaire[:id]
)

vin = Supply.create!(
  title: "Vin Rouge",
  quantity: 2,
  category_id: drinks[:id],
  event_id: piscine[:id]
)

music = Supply.create!(
  title: "Enceintes",
  quantity: 1,
  category_id: other[:id],
  event_id: piscine[:id]
)

puts "Supplies OK"
puts "........................"
puts "Adding Participations..."

part_max = Participation.create!(
  confirmed: true,
  event_id: piscine[:id],
  user_id: max[:id]
)

part_aym = Participation.create!(
  confirmed: true,
  event_id: anniversaire[:id],
  user_id: aym[:id]
)

part_anto = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: anto[:id]
)

part_chris = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: chris[:id]
)

puts "Participations OK"
puts "........................"
puts " Adding Contributions..."

contrib_max = Contribution.create!(
  part: 2,
  state: true,
  supply_id: baguettes[:id],
  participation_id: part_max[:id]
)

contrib_aym = Contribution.create!(
  part: 1,
  state: true,
  supply_id: music[:id],
  participation_id: part_aym[:id]
)

contrib_chris = Contribution.create!(
  part: 3,
  state: true,
  supply_id: saucisses[:id],
  participation_id: part_chris[:id]
)

contrib_anto = Contribution.create!(
  part: 6,
  state: true,
  supply_id: saucisses[:id],
  participation_id: part_anto[:id]
)


puts "Contributions OK"
puts "Seed DONE !!! "





