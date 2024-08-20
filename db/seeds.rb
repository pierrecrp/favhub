# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

List.all.destroy

Favorite.all.destroy

Follow.all.destroy

Tag.all.destroy

user = User.create(username: "", first_name: "", last_name: "", email: "", password: "")

list = List.create(name: "", public: false, user: User.all.sample)

7.times do
  favorite = Favorite.create(name: "", description: "", price: , size: "", url: "", user: list.user , list: list )

  2.times do
  tag = Tag.create(name: "", favorite: favorite)
  end
end
