class FavoriteTag < ApplicationRecord
  belongs_to :favorite
  belongs_to :tag
end
