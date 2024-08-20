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
List.destroy_all
User.destroy_all

user1 = User.create(user_name: "Allycious", first_name: "Halima", last_name: "Lamliji", email: "allycious.contact@gmail.com", password: "azerty")
user2 = User.create(user_name: "pierrecrp", first_name: "Pierre", last_name: "Crepin", email: "pierrecrepin33200@gmail.com", password: "azerty")
user3 = User.create(user_name: "Leo", first_name: "Léo", last_name: "Turcat", email: "turcatleo@gmail.com", password: "azerty")

list1 = List.create(name: "Ma wishlist", public: true, user: user1)
list2 = List.create(name: "My son's wishes", public: false, user: user2)
list3 = List.create(name: "Mami's giftlist", public: false, user: user3)

sources = ["Vinted", "Le Bon Coin"]

7.times do
  favorite = Favorite.create(name: Faker::Commerce.product_name, description: Faker::Commerce.department(max: 10),
  price: Faker::Commerce.price, size: "XS", source: sources.sample, user: user1, list: list1)

  2.times do
    tag = Tag.create(name: Faker::Commerce.brand, favorite: favorite)
  end
end

7.times do
  favorite = Favorite.create(name: Faker::Commerce.product_name, description: Faker::Commerce.department(max: 10),
  price: Faker::Commerce.price, size: "XS", source: sources.sample, user: user2, list: list2)

  2.times do
  tag = Tag.create(name: Faker::Commerce.brand, favorite: favorite)
  end
end

7.times do
  favorite = Favorite.create(name: Faker::Commerce.product_name, description: Faker::Commerce.department(max: 10),
  price: Faker::Commerce.price, size: "XS", source: sources.sample, user: user2, list: list2)

  2.times do
  tag = Tag.create(name: Faker::Commerce.brand, favorite: favorite)
  end
end
