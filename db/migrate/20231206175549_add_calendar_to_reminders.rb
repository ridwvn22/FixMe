class AddCalendarToReminders < ActiveRecord::Migration[7.1]
  def change
    add_reference :reminders, :calendar, polymorphic: true, null: true
  end
end
