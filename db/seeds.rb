# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create({username: "brekky", password: "hello123"})
User.create({username: "uglymofo", password: "butt123"})
User.create({username: "ye", password: "kanye123"})
Friendship.create({from_user: 1, to_user: 2, status: true})
Friendship.create({from_user: 2, to_user: 1, status: true})
Friendship.create({from_user: 1, to_user: 3, status: true})
Friendship.create({from_user: 3, to_user: 1, status: true})
Message.create({body: "Tryna Run it?", sender_id: 1, receiver_id: 2})
Message.create({body: "Hell yeah, setting up!", sender_id: 2, receiver_id: 1})