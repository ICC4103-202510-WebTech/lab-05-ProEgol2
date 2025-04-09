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

p = 0
10.times do |t|
    User.create(email:"example@mail_%d.com" % [p], first_name:"fname_%d" % [p], last_name:"lname_%d"% [p])
    Chat.create(sender_id:10+p, receiver_id:50+p)
    Message.create(chat_id:10+p, user_id: 50+p, body:"Body example %d" % [p])
    p+=1
end