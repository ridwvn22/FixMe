class CreateLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :logs do |t|
      t.references :user, null: false, foreign_key: true
      t.references :habit, null: false, foreign_key: true
      t.date :entry_date
      t.text :notes

      t.timestamps
    end
  end
end
