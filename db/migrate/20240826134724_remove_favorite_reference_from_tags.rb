class RemoveFavoriteReferenceFromTags < ActiveRecord::Migration[7.1]
  def change
    remove_reference :tags, :favorite, index: true, foreign_key: true
    add_reference :tags, :user, foreign_key: true, index: true
  end
end
