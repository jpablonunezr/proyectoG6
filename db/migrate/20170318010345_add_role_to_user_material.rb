class AddRoleToUserMaterial < ActiveRecord::Migration[5.0]
  def change
    add_column :user_materials, :role, :integer
  end
end
