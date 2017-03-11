class CreateUserNetworks < ActiveRecord::Migration[5.0]
  def change
    create_table :user_networks do |t|
      t.references :user, foreign_key: true
      t.references :network, foreign_key: true

      t.timestamps
    end
  end
end
