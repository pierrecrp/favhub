# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

List.all.destroy

Favorite.all.destroy

Follow.all.destroy

Tag.all.destroy


lists = [
  { name: "Christmas list", public: false, user_id: }
  { name: "Christmas list", public: false, user_id: }
  { name: "Christmas list", public: false, user_id: }
  { name: "Christmas list", public: false, user_id: }
  { name: "Christmas list", public: false, user_id: }
  { name: "Christmas list", public: false, user_id: }
  { name: "Christmas list", public: false, user_id: }
]

favorites = [
  { name: "", description: "", price: , size: "", url: "", user_id:  ,list_id: }
  { name: "", description: "", price: , size: "", url: "", user_id:  ,list_id: }
  { name: "", description: "", price: , size: "", url: "", user_id:  ,list_id: }
  { name: "", description: "", price: , size: "", url: "", user_id:  ,list_id: }
  { name: "", description: "", price: , size: "", url: "", user_id:  ,list_id: }
  { name: "", description: "", price: , size: "", url: "", user_id:  ,list_id: }
  { name: "", description: "", price: , size: "", url: "", user_id:  ,list_id: }
]

follows = [
  { follower_id: , followed_id: }
  { follower_id: , followed_id: }
  { follower_id: , followed_id: }
  { follower_id: , followed_id: }
  { follower_id: , followed_id: }
  { follower_id: , followed_id: }
  { follower_id: , followed_id: }
]

tags = [
  { name: "", favorite_id: }
  { name: "", favorite_id: }
  { name: "", favorite_id: }
  { name: "", favorite_id: }
  { name: "", favorite_id: }
  { name: "", favorite_id: }
  { name: "", favorite_id: }
]

lists.each do |list|
  List.new(list)
end

favorites.each do |favorite|

end

follows.each do |follow|

end

tags.each do |tag|

end
