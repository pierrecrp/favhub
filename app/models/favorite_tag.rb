class FavoriteTag < ApplicationRecord
  belongs_to :favorite
  belongs_to :tag

  validates :favorite, uniqueness: {scope: :tag}
end
