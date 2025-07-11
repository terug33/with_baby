class CreateStoreTags < ActiveRecord::Migration[6.1]
  def change
    create_table :store_tags do |t|
      t.references :store, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
