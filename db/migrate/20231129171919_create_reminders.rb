class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.string :frequency
      t.references :habit, null: false, foreign_key: true

      t.references :calendar, polymorphic: true, null: true

      t.timestamps
    end
  end
end
