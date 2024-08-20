class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :list
  has_many :favorites
end
