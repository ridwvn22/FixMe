class CreateHabits < ActiveRecord::Migration[7.1]
    def change
      create_table :habits do |t|
        t.string :name
        t.string :description
        t.integer :duration  
        t.references :user, null: false, foreign_key: true
        t.string :status
        t.references :calendar, polymorphic: true, null: true
  
        t.timestamps  
    end
  end
end