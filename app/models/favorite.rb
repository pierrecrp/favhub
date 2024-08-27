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

  def source_url
    if self.source == "Vinted"
      return "https://cdn.brandfetch.io/idFLvfRPd0/w/800/h/800/theme/dark/icon.jpeg?k=id64Mup7ac&t=1721841761912?t=1721841761912"
    elsif self.source == "Le Bon Coin"
      return "http://www.image-heberg.fr/files/1724751785995950683.png"
    end
  end
end
