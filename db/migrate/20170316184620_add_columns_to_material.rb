class AddColumnsToMaterial < ActiveRecord::Migration[5.0]
  def change
    add_reference :materials, :subject, foreign_key: true
    add_reference :materials, :level, foreign_key: true
  end
end
