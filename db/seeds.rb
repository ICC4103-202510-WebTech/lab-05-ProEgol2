# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#rails db::reset

users = User.create!([
  {
    first_name: "Rufus",
    last_name: "Trufus",
    email: "rufus@gmail.com"
  },
  {
    first_name: "Jeremy",
    last_name: "Elbertson",
    email: "jer@gmail.com"
  },
  {
    first_name: "Vincent",
    last_name: "Melpert",
    email: "vinny@gmail.com"
  },
  {
    first_name: "Jobel",
    last_name: "Fren",
    email: "joey@gmail.com"
  }
])

chats = Chat.create!([
    {
        sender: users[0],
        receiver: users[1],
    },
    {
        sender: users[2],
        receiver: users[3],
    }
])

messages = Message.create!([
    {
        chat: chats[0],
        sender: users[0],
        body: "This is a message"
    },
    {
        chat: chats[1],
        sender: users[2],
        body: "This is another message"
    }
])