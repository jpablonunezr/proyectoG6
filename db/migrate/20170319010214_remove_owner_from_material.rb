class RemoveOwnerFromMaterial < ActiveRecord::Migration[5.0]
  def change
    remove_column :materials, :owner, :integer
  end
end
