class AddLevelToUser < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :level, foreign_key: true, :default => 1
  end
end
