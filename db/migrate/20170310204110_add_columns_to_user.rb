class AddColumnsToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :photo, :string
    add_column :users, :biography, :string
    add_column :users, :city, :string
  end
end
