class AddSourceToFavorites < ActiveRecord::Migration[7.1]
  def change
    add_column :favorites, :source, :string
  end
end
