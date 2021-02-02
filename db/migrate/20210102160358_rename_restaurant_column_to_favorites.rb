class RenameRestaurantColumnToFavorites < ActiveRecord::Migration[5.1]
  def change
    rename_column :favorites, :restaurant, :restaurant_name
  end
end
