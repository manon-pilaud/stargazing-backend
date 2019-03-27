class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :description
      t.float :latitude
      t.float :longitude
      t.string :category
      t.integer :rating
      t.string :image
      t.string :area
      t.string :country
      t.timestamps
    end
  end
end
