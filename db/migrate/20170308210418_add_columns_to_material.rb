class AddColumnsToMaterial < ActiveRecord::Migration[5.0]
  def change
    add_column :materials, :title, :string
    add_column :materials, :description, :text
    add_reference :materials, :user, foreign_key: true
  end
end
