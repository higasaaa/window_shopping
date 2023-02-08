class CreateCoordinateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :coordinate_tags do |t|
      t.integer :tag_id, null: false
      t.integer :coordinate_id, null: false
      t.timestamps
    end
  end
end
