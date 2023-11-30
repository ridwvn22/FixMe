class AddHabitToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :habit, :string
    add_index :users, :habit
  end
end
