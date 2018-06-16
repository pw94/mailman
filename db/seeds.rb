# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

default_password = "000000"

users = User.create([
    { name: Faker::FunnyName.name, email: Faker::Internet.unique.email, password: default_password},
    { name: Faker::FunnyName.name, email: Faker::Internet.unique.email, password: default_password},
    { name: Faker::FunnyName.name, email: Faker::Internet.unique.email, password: default_password}
])

records = Record.create([
    { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, owner: users[0]},
    { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, owner: users[0]},
    { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, owner: users[0], users: [users[1]]},
    { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, owner: users[0], users: [users[2]]},
    { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, owner: users[0], users: [users[1], users[2]]},
    { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, owner: users[1]},
    { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, owner: users[1], users: [users[0], users[2]]},
    { name: Faker::Name.unique.name, email: Faker::Internet.unique.email, owner: users[2]}
])

messages = Message.create([
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[0], records: records[0..4]},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[0], records: records[1..4]},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[0], records: records[0...4]},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[0], records: records},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[0], records: records[0...1]},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[1], records: records[2..-1]},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[1], records: records[4...6]},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[1], records: records[0..3]},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[2], records: records[0..-1]},
    { subject: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user: users[2], records: records[0...1]}
])