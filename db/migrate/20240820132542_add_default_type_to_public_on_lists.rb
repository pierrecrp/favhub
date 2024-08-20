class AddDefaultTypeToPublicOnLists < ActiveRecord::Migration[7.1]
  def change
    change_column :lists, :public, :boolean, default: false
  end
end
