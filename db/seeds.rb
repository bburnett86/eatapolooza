# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
League.create!(name: "League Of Greatness")
League.create!(name: "Extreme Eaters")
League.create!(name: "Hungry Hunry Hypocrites")
League.create!(name: "Just Us League")
League.create!(name: "Who's got the Beef?")
League.create!(name: "M Night Shyamaleague")
Person.parse_csv("weighins.csv")
Checkin.parse_csv("weighins.csv")

200.times do
  LeagueEventJoin.create(league_id: rand(1..6), event_id: rand(1..95))
end