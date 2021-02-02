class AddRestaurantAddressToFavorites < ActiveRecord::Migration[5.1]
  def change
    add_column :favorites, :restaurant_address, :string
  end
end
