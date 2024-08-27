class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :list, optional: true
  has_many :favorite_tags, dependent: :destroy
  has_many :tags, through: :favorite_tags

  include PgSearch::Model
  pg_search_scope :search_favorites,
  against: [ :name, :description, :source ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
