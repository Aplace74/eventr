# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "date"

puts "Clearing DB..."
Contribution.destroy_all
Participation.destroy_all
Supply.destroy_all
Category.destroy_all
Event.destroy_all
User.destroy_all
Fee.destroy_all
FeeContribution.destroy_all

puts "Cleaning OK"
puts "................."
puts "Creating users..."

chris = User.create!(
  first_name: "Christophe",
  last_name: "Lepretre",
  email: "chrislep62@gmail.com",
  password: "123456",
)
chris.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHJNRSJ2X-8033519bd289-48"
chris.save

max = User.create!(
  first_name: "Maxime",
  last_name: "Derouet",
  email: "mxderouet@gmail.com",
  password: "password",
)
max.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHJNDRP50-4cbef4975b23-48"
max.save

aym = User.create!(
  first_name: "Aymeric",
  last_name: "Dhalluin",
  email: "aymeric.dhalluin@gmail.com",
  password: "123456",
)
aym.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHVHHPMT6-070fc749feb5-48"
aym.save

anto = User.create!(
  first_name: "Antoine",
  last_name: "Place",
  email: "antoineplace2212@gmail.com",
  password: "123456",
)
anto.remote_avatar_url = "https://ca.slack-edge.com/T02NE0241-UHW3LLS4V-bbfea18ca08e-48"
anto.save

lea = User.create!(
  first_name: "Lea",
  last_name: "Woittequand",
  email: "lea@gmail.com",
  password: "123456",
)
lea.remote_avatar_url = "https://avatars3.githubusercontent.com/u/29428824?v=4"
lea.save

daniel = User.create!(
  first_name: "Daniel",
  last_name: "Féline",
  email: "dany@gmail.com",
  password: "123456",
)
daniel.remote_avatar_url = "https://res.cloudinary.com/dwptvy074/image/upload/v1560499983/0_xdj1ii.jpg"
daniel.save

charles = User.create!(
  first_name: "Charles",
  last_name: "Noppe",
  email: "charles@gmail.com",
  password: "123456",
)
charles.remote_avatar_url = "https://avatars1.githubusercontent.com/u/46595965?v=4"
charles.save

fx = User.create!(
  first_name: "François-Xavier",
  last_name: "Abraham",
  email: "fx@gmail.com",
  password: "123456",
)
fx.remote_avatar_url = "https://avatars0.githubusercontent.com/u/7604375?v=4"
fx.save

margaux = User.create!(
  first_name: "Margaux",
  last_name: "Feslard",
  email: "margaux@gmail.com",
  password: "123456",
)
margaux.remote_avatar_url = "https://avatars2.githubusercontent.com/u/48242659?v=4"
margaux.save

marie = User.create!(
  first_name: "Marie",
  last_name: "Caulliez",
  email: "marie@gmail.com",
  password: "123456",
)
marie.remote_avatar_url = "https://avatars2.githubusercontent.com/u/49184857?v=4"
marie.save

mariepierre = User.create!(
  first_name: "Marie-Pierre",
  last_name: "Vincent",
  email: "mariepierre@gmail.com",
  password: "123456",
)
mariepierre.remote_avatar_url = "https://avatars2.githubusercontent.com/u/49431430?v=4"
mariepierre.save

puts "Users OK"
puts ".................."
puts "Creating Events..."

barbecue = Event.create!(
  description: "Après neuf semaines de travail acharné, rien de tel qu'un petit barbecue",
  title: "Barbecue fin de batch",
  start_date: Date.new(2019, 6, 22),
  end_date: Date.new(2019, 6, 22),
  picture: "",
  address: "Le Château Des Ormes",
  city: "Lambersart",
  zipcode: "59130",
  user_id: anto[:id],
  token: (0...10).map { (65 + rand(26)).chr }.join,
)
barbecue.remote_picture_url = "https://www.flawlessmilano.com/wp-content/uploads/2017/04/barbecue-cover.jpg?x53037"
barbecue.save

part_anto = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: anto[:id],
  organizer: true,
)

puts "Users & events OK !"
puts "...................."
puts "Adding Categories..."

drinks = Category.create!(
  name: "Boissons",
  icon: "fas fa-beer",
)

food = Category.create!(
  name: "Nourriture",
  icon: "fas fa-drumstick-bite",
)

other = Category.create!(
  name: "Autres",
  icon: "fas fa-music",
)

puts "Categories OK !"
puts ".................."
puts "Adding supplies..."

saucisses = Supply.create!(
  title: "Saucisses",
  quantity: 20,
  category_id: food[:id],
  event_id: barbecue[:id],
)

merguez = Supply.create!(
  title: "Merguez",
  quantity: 20,
  category_id: food[:id],
  event_id: barbecue[:id],
)

baguettes = Supply.create!(
  title: "Baguettes",
  quantity: 10,
  category_id: food[:id],
  event_id: barbecue[:id],
)

biere = Supply.create!(
  title: "Packs de bière",
  quantity: 6,
  category_id: drinks[:id],
  event_id: barbecue[:id],
)

juice = Supply.create!(
  title: "Jus de fruits",
  quantity: 4,
  category_id: drinks[:id],
  event_id: barbecue[:id],
)

bbq = Supply.create!(
  title: "Barbecue",
  quantity: 1,
  category_id: other[:id],
  event_id: barbecue[:id],
)

music = Supply.create!(
  title: "Sono",
  quantity: 1,
  category_id: other[:id],
  event_id: barbecue[:id],
)

dessert = Supply.create!(
  title: "Dessert pour tout le monde",
  quantity: 1,
  category_id: food[:id],
  event_id: barbecue[:id],
)

sangria = Supply.create!(
  title: "Sangria",
  quantity: 1,
  category_id: drinks[:id],
  event_id: barbecue[:id],
)

puts "Supplies OK"
puts "........................"
puts "Adding Participations..."

part_max = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: max[:id],
)

part_chris = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: chris[:id],
)

part_lea = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: lea[:id],
)

part_daniel = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: daniel[:id],
)

part_charles = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: charles[:id],
)

part_fx = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: fx[:id],
)

part_marie = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: marie[:id],
)

part_margaux = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: margaux[:id],
)

part_mariepierre = Participation.create!(
  confirmed: true,
  event_id: barbecue[:id],
  user_id: mariepierre[:id],
)

puts "Participations OK"
puts "........................"
puts " Adding Contributions..."

contrib_max = Contribution.create!(
  part: 2,
  supply_id: baguettes[:id],
  participation_id: part_max[:id],
)

contrib_chris = Contribution.create!(
  part: 20,
  supply_id: saucisses[:id],
  participation_id: part_chris[:id],
)

Contribution.create!(
  part: 4,
  supply_id: juice[:id],
  participation_id: part_marie[:id]
)

Contribution.create!(
  part: 1,
  supply_id: sangria[:id],
  participation_id: part_mariepierre[:id]
)

Contribution.create!(
  part: 10,
  supply_id: merguez[:id],
  participation_id: part_lea[:id]
)

Contribution.create!(
  part: 10,
  supply_id: merguez[:id],
  participation_id: part_fx[:id]
)

Contribution.create!(
  part: 1,
  supply_id: bbq[:id],
  participation_id: part_margaux[:id]
)

Contribution.create!(
  part: 1,
  supply_id: dessert[:id],
  participation_id: part_anto[:id]
)

puts "Contributions OK"
puts "----------"
puts "creating fees"

Fee.create!(
  cost: 15,
  participation_id: part_chris[:id],
)

puts "fees OK !"
puts "Seed DONE !!! "
