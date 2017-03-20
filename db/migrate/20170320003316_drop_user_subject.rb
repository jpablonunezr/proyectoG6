class DropUserSubject < ActiveRecord::Migration[5.0]
  def change
  	drop_table :user_subjects do |t|
    t.references :user, foreign_key: true
    t.references :subject, foreign_key: true
    t.timestamps
    end
  end
end
