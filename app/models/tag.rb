class Tag < ApplicationRecord
  belongs_to :user
  has_many :favorite_tags 
end
