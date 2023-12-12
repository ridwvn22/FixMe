class AddCalendarToHabits < ActiveRecord::Migration[7.1]
  def change
    add_reference :habits, :calendar, polymorphic: true, null: true
  end
end
