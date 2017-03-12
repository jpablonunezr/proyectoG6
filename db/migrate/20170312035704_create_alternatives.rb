class CreateAlternatives < ActiveRecord::Migration[5.0]
  def change
    create_table :alternatives do |t|
      t.text :content
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
