class AddDateToHabits < ActiveRecord::Migration[7.1]
  def change
    add_column :habits, :date, :datetime
  end
end
