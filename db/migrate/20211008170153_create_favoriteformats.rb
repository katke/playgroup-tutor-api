class CreateFavoriteformats < ActiveRecord::Migration[6.1]
  def change
    create_table :favoriteformats do |t|
      t.string :format
      t.integer :user_id

      t.timestamps
    end
  end
end
