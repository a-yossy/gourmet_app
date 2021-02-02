class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true, null: false
      t.string :restaurant

      t.timestamps
    end
  end
end
