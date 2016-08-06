# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "abc@abc.com", password: "123456")
User.create!(email: "def@def.com", password: "123456")
users = User.order(:created_at).take(2)
10.times do
 content = Faker::Lorem.sentence(5)
 users.each { |user|
     user.tweets.create!(note: content)
 }
end
