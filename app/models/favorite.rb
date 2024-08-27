class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :list, optional: true
  has_many :tags, dependent: :destroy
  has_many_attached :photos

  include PgSearch::Model
  pg_search_scope :search_favorites,
  against: [ :name, :description, :source ],
  using: {
    tsearch: { prefix: true } # <-- now `superman batm` will return something!
  }
end
