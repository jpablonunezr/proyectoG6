class CreateUserMaterials < ActiveRecord::Migration[5.0]
  def change
    create_table :user_materials do |t|
      t.integer :role
      t.references :material, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
