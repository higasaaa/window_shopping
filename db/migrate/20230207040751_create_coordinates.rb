class CreateCoordinates < ActiveRecord::Migration[6.1]
  def change
    create_table :coordinates do |t|
      t.integer :tag_id
      t.text :coordinates_description, null: false
      t.integer :total_price, null: false
      t.timestamps
    end
  end
end
