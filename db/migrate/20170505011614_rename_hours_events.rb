class RenameHoursEvents < ActiveRecord::Migration[5.0]
  def change
    rename_table :hours, :events
  end
end
