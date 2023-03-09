class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.string :customer_id, null: false
      t.string :coordinate_id, null: false
      t.string :tag_id
      t.timestamps
    end
  end
end
