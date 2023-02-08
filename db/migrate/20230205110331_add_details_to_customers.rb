class AddDetailsToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :nickname, :string
    add_column :customers, :birthdate, :date
    add_column :customers, :sex, :string
    add_column :customers, :live_area, :string
    add_column :customers, :is_deleted, :boolean, default: false
  end
end
