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

Tag.destroy_all
Favorite.destroy_all
FavoriteTag.destroy_all
List.destroy_all
Follow.destroy_all
User.destroy_all

user1 = User.create(user_name: "Allycious", first_name: "Halima", last_name: "Lamliji", email: "allycious.contact@gmail.com", password: "azerty", avatar: "https://www.festival-cinecomedies.com/wp-content/uploads/2022/09/Pinot-Simple-Flic-portrait-Jugnot.jpg")
user2 = User.create(user_name: "pierrecrp", first_name: "Pierre", last_name: "Crepin", email: "pierrecrepin33200@gmail.com", password: "azerty", avatar: "https://cache.magicmaman.com/data/photo/w1000_ci/6w/lara-fabian1.jpg")
user3 = User.create(user_name: "Leo", first_name: "Léo", last_name: "Turcat", email: "turcatleo@gmail.com", password: "azerty", avatar: "https://www.gala.fr/imgre/fit/~1~gal~2023~09~28~db6ef588-25cd-486f-8b0f-18e849519e0c.jpeg/3463x2616/quality/80/brad-pitt.jpeg")
list1 = List.create(name: "Ma wishlist", public: true, user: user1)
list2 = List.create(name: "My son's wishes", public: false, user: user2)
list3 = List.create(name: "Mami's giftlist", public: false, user: user3)
list4 = List.create(name: "Sneakers", public: false, user: user2)

sources = ["Vinted", "Le Bon Coin"]

20.times do
  favorite = Favorite.create(name: Faker::Commerce.product_name, description: Faker::Commerce.department(max: 10),
  price: Faker::Commerce.price, size: "XS", source: sources.sample, user: user1, list: list1)


end

7.times do
  favorite = Favorite.create(name: Faker::Commerce.product_name, description: Faker::Commerce.department(max: 10),
  price: Faker::Commerce.price, size: "XS", source: sources.sample, user: user2, list: list2)

end

7.times do
  favorite = Favorite.create(name: Faker::Commerce.product_name, description: Faker::Commerce.department(max: 10),
  price: Faker::Commerce.price, size: "XS", source: sources.sample, user: user3, list: list3)

end

  7.times do
    favorite = Favorite.create(name: Faker::Commerce.product_name, description: Faker::Commerce.department(max: 10),
    price: Faker::Commerce.price, size: "XS", source: sources.sample, user: user2, list: list4)
  end

Follow.create(follower: user3, followed: user1)
Follow.create(follower: user3, followed: user2)

Follow.create(follower: user2, followed: user1)
Follow.create(follower: user2, followed: user3)
