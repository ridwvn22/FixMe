class AddDescriptionToReminders < ActiveRecord::Migration[7.1]
  def change
    add_column :reminders, :description, :string
  end
end
