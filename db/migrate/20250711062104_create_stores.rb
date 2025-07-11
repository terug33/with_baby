class CreateStores < ActiveRecord::Migration[6.1]
  def change
    create_table :stores do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true 
      t.string :name, null: false
      t.text :description, null: false
      t.integer :score, null: false
      t.string :address, null: false
      t.string :zip_code
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
