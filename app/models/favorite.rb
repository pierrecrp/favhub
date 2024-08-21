class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :list, optional: true
  has_many :tags, dependent: :destroy
end
