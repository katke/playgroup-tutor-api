class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :zipcode
      t.float :latitude
      t.float :longitude
    end
  end
end
