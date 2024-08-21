class ChangeListsTypeOnFavorites < ActiveRecord::Migration[7.1]
  def change
    change_column :favorites, :list_id, :bigint, null: true
  end
end
