class CreateHabits < ActiveRecord::Migration[7.1]
  def change
    create_table :habits do |t|
      t.string :name
      t.string :description
      t.timestamp :duration
      t.references :users, null: false, foreign_key: true
      t.string :status
      

      t.timestamps
    end
  end
end
