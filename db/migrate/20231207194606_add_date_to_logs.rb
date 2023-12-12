class AddDateToLogs < ActiveRecord::Migration[7.1]
  def change
    add_column :logs, :date, :datetime
  end
end
