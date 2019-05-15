# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

# 10.times do 
#   user = User.create({
#     first_name: Faker::Name.first_name,
#     last_name: Faker::Name.last_name,
#     username: Faker::Internet.email,
#     likes: 0,
#     password: "password"
#     })
# end

# ["breakfast", "brunch","lunch", "dinner"].each do |item|
#   Category.create({label: item})
# end

data = ActiveSupport::JSON.decode(File.read("db/sample.json"))
data.each do |attributes|
  Location.create!(
    city: attributes['city'],
    country: attributes['country'],
    latitude: attributes['lat'],
    longitude: attributes['lng']
  )
end