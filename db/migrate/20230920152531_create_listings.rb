class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.references :host, null: false, foreign_key: {to_table: :users}
      t.string :address, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.integer :num_beds, null: false
      t.integer :num_bedrooms, null: false, index: true
      t.integer :number_bathrooms, null: false
      t.float :price, null: false, index: true
      t.boolean :has_ac, null: false
      t.boolean :has_wifi, null: false
      t.boolean :has_pets_allowed, null: false
      t.boolean :has_washer_dryer, null: false
      t.float :latitude, null: false, index: true
      t.float :longitude, null: false, index: true
      t.timestamps
    end
  end
end
