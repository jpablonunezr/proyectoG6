class RemoveRoleFromUserMaterial < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_materials, :role, :string
  end
end
