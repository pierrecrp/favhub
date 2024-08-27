class CreateFavoriteTags < ActiveRecord::Migration[7.1]
  def change
    create_table :favorite_tags do |t|
      t.references :favorite, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
