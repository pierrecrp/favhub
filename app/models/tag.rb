class Tag < ApplicationRecord
  belongs_to :user
  has_many :favorite_tags 

  validates :name, uniqueness: true
end
